//
//  ViewController.h
//  PDSSetting_objcDemo
//
//  Created by w91379137 on 2016/3/26.
//  Copyright © 2016年 w91379137. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, copy) void (^randomColorBlock)(void);
@property (nonatomic, copy) void (^returnColorBlock)(void);

@end

