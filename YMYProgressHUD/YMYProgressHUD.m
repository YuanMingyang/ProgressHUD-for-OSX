//
//  YMYProgressHUD.m
//  MyProgress
//
//  Created by Yang on 2018/4/28.
//  Copyright © 2018年 Yang. All rights reserved.
//

#import "YMYProgressHUD.h"

@interface YMYProgressHUD ()
@property (weak) IBOutlet NSView *hudView;
@property (weak) IBOutlet NSProgressIndicator *progressView;
@property (weak) IBOutlet NSTextField *titleLabel;
@property (weak) IBOutlet NSImageView *tagImageView;

@end


@implementation YMYProgressHUD
static YMYProgressHUD *progress = nil;
-(void)awakeFromNib{
    [super awakeFromNib];
    [self.hudView setWantsLayer:YES];
    self.hudView.layer.backgroundColor = [NSColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1].CGColor;
    self.hudView.layer.cornerRadius = 10;
    self.hudView.layer.masksToBounds = YES;
}

+(void)createWithFatherView:(NSView *)view{
    NSNib *nib = [[NSNib alloc] initWithNibNamed:@"YMYProgressHUD" bundle:nil];
    NSArray * topLevelObjects;
    if ([nib instantiateWithOwner:self topLevelObjects:&topLevelObjects]) {
        for (id topLeveObject in topLevelObjects) {
            if ([topLeveObject isKindOfClass:[YMYProgressHUD class]]) {
                progress = topLeveObject;
                break;
            }
        }
    }
    progress.frame = view.bounds;
    [view addSubview:progress];
}

+(void)showMessage:(NSString *)message to:(NSView *)view{
    if (!progress) {
        [YMYProgressHUD createWithFatherView:view];
    }
    progress.titleLabel.stringValue = message;
    progress.tagImageView.hidden = YES;
    progress.progressView.hidden = NO;
    [progress.progressView startAnimation:nil];
}
+(void)showSuccess:(NSString *)message To:(NSView *)view{
    if (!progress) {
        [YMYProgressHUD createWithFatherView:view];
    }
    progress.titleLabel.stringValue = message;
    progress.tagImageView.hidden = NO;
    progress.tagImageView.image = [NSImage imageNamed:@"success"];
    progress.progressView.hidden = YES;
    [progress.progressView startAnimation:nil];
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:2];
    
}

+(void)showError:(NSString *)message To:(NSView *)view{
    if (!progress) {
        [YMYProgressHUD createWithFatherView:view];
    }
    progress.titleLabel.stringValue = message;
    progress.tagImageView.hidden = NO;
    progress.tagImageView.image = [NSImage imageNamed:@"error"];
    progress.progressView.hidden = YES;
    [progress.progressView startAnimation:nil];
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:2];
}
+(void)dismiss{
    [progress removeFromSuperview];
    progress  = nil;
}


-(void)dealloc{
    NSLog(@"<<<YMYProgressHUD>>>");
}
@end
