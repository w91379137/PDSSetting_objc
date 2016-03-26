//
//  ViewController.m
//  PDSSetting_objcDemo
//
//  Created by w91379137 on 2016/3/26.
//  Copyright © 2016年 w91379137. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Init
- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.randomColorBlock) self.randomColorBlock();
}

- (void)viewWillDisappear:(BOOL)animated
{
    if (self.returnColorBlock) self.returnColorBlock();
    [super viewWillDisappear:animated];
}

- (void)dealloc
{
    NSLog(@"dealloc %@",NSStringFromClass([self class]));
}

#pragma mark - IBAction
- (IBAction)pushAction:(id)sender
{
    weakSelfMake(weakSelf);
    
    ViewController *vc = [[ViewController alloc] init];
    weakMake(vc, weakvc);
    
    [weakvc setRandomColorBlock:^{
        weakvc.view.backgroundColor = [weakvc randomColor];
        
        for (UIView *view in weakvc.view.subviews) {
            maybe(view, UILabel).textColor = [weakvc randomColor];
            [maybe(view, UIButton) setTitleColor:[weakvc randomColor]
                                        forState:UIControlStateNormal];
        }
    }];
    
    [weakvc setReturnColorBlock:^{
        
        weakSelf.view.backgroundColor = weakvc.view.backgroundColor;
        
        for (UIView *view in weakSelf.view.subviews) {
            
            for (UIView *viewInVc in weakvc.view.subviews) {
                
                if (maybe(view, UILabel) && maybe(viewInVc, UILabel)) {
                    
                    maybe(view, UILabel).textColor =
                    maybe(viewInVc, UILabel).textColor;
                    
                }
                
                if (maybe(view, UIButton) && maybe(viewInVc, UIButton)) {
                    
                    UIColor *color =
                    [maybe(viewInVc, UIButton) titleColorForState:UIControlStateNormal];
                    
                    [maybe(view, UIButton) setTitleColor:color
                                                forState:UIControlStateNormal];
                    
                }
            }
        }
    }];
    
    [self.navigationController pushViewController:vc
                                         animated:YES];
}

#pragma mark - Random Color
- (UIColor *)randomColor
{
    return
    [UIColor colorWithRed:arc4random_uniform(255) / 255.0f
                    green:arc4random_uniform(255) / 255.0f
                     blue:arc4random_uniform(255) / 255.0f
                    alpha:1];
}

@end
