//
//  UtilsMacro.h
//  GreatArt
//
//  Created by WZ on 2018/1/15.
//  Copyright © 2018年 steven. All rights reserved.
//

#ifndef UtilsMacro_h
#define UtilsMacro_h

//只是给oc的头文件添加这个拷贝这个源文件,c语言的文件不拷贝
#ifdef __OBJC__

//调试NSLog
#ifdef DEBUG   //#ifndef __OPTIMIZE__
#define NSLog(...)  NSLog(__VA_ARGS__)
#else
#define NSLog(...)  {}
#endif

//颜色工具宏
#define  RGBA(r, g, b, a)     [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define  RGB(r, g, b)         RGBA(r, g, b, 1.0)

//判断当前手机系统版本
#define IOS_VERSION               [[[UIDevice currentDevice] systemVersion] floatValue]
#define IOS8_LATER                (IOS_VERSION >= 8.0)
#define IOS9_LATER                (IOS_VERSION >= 9.0)
#define IOS10_LATER               (IOS_VERSION >= 10.0)
#define IOS11_LATER               (IOS_VERSION >= 11.0)

//屏幕大小尺寸
#define ScreenH             [UIScreen mainScreen].bounds.size.height
#define ScreenW             [UIScreen mainScreen].bounds.size.width
#define ScreenPiexlSize     UIScreen.mainScreen.currentMode.size
#define IPhone4s            CGSizeEqualToSize(ScreenPiexlSize, CGSizeMake(640, 960))//(ScreenW == 320 && ScreenH == 480) //横屏变为(480,320)
#define IPhone5s            CGSizeEqualToSize(ScreenPiexlSize, CGSizeMake(640, 1136))//(ScreenW == 320 && ScreenH == 568)
#define IPhone6s            CGSizeEqualToSize(ScreenPiexlSize, CGSizeMake(750, 1334))//(ScreenW == 375 && ScreenH == 667)
#define IPhone6p            CGSizeEqualToSize(ScreenPiexlSize, CGSizeMake(1242, 2208))//(ScreenW == 414 && ScreenH == 736)
#define IPhoneX             CGSizeEqualToSize(ScreenPiexlSize, CGSizeMake(1125, 2436))//(ScreenW == 375 && ScreenH == 812)

//常用代码块
#define APP_DELEGATE           ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define KEY_WINDOW             [UIApplication sharedApplication].windows[0]  //不要使用keyWindow来获取,因为可能为nil

//在非 ARC 环境下运行下面的代码
#if !__has_feature(objc_arc)
#endif

#endif //这里写只可以在oc中使用的头文件,c语言不能使用的
#endif /* UtilsMacro_h */
