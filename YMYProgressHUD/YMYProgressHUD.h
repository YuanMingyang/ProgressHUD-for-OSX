//
//  YMYProgressHUD.h
//  MyProgress
//
//  Created by Yang on 2018/4/28.
//  Copyright © 2018年 Yang. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface YMYProgressHUD : NSView
+(void)showMessage:(NSString *)message to:(NSView *)view;
+(void)showSuccess:(NSString *)message To:(NSView *)view;
+(void)showError:(NSString *)message To:(NSView *)view;
+(void)dismiss;
@end
