//
//  UtilsMacro.h
//  YJMacro
//
//  Created by ChenEason on 16/9/26.
//  Copyright © 2016年 ChenEason. All rights reserved.
//

#ifndef YJUtilsMacro_h
#define YJUtilsMacro_h


//设备相关

//获取设备的物理高度
#define ScreenHeight        [UIScreen mainScreen].bounds.size.height
//获取设备的物理宽度
#define ScreenWidth         [UIScreen mainScreen].bounds.size.width
//iPhoneX, XS, XS Max相关
#define Is_iPhoneX                              (((int)((ScreenHeight/ScreenWidth)*100) == 216)?YES:NO)
#define SafeAreaTopHeight                       (Is_iPhoneX ? 88 : 64)
#define SafeAreaBottomHeight                    (Is_iPhoneX ? 34 : 0)
//监听键盘的宏定义
#define _UIKeyboardFrameEndUserInfoKey (&UIKeyboardFrameEndUserInfoKey != NULL ? UIKeyboardFrameEndUserInfoKey : @"UIKeyboardBoundsUserInfoKey")
//系统版本
#define SYSTEM_VERSION      [[[UIDevice currentDevice] systemVersion] floatValue]
//导航栏高度
#define NAVIGATION_BAR_HEIGHT   64.0f
//状态栏高度
#define STATUS_BAR_HEIGHT       20.0f
//TableViewCell高度
#define TABLEVIEW_CELL_HEIGHT   44.0f

// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
// 设置颜色RGB
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]


#define KCachesPath         [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define KDocumentPath       [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define KLibraryPath        [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0]


#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

// App信息
#define APP_NAME			[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define APP_VERSION         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define APP_BUILD_VERSION	[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

#endif
