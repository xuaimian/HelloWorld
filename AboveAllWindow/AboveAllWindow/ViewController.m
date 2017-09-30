//
//  ViewController.m
//  AboveAllWindow
//
//  Created by spring on 2017/9/30.
//  Copyright © 2017年 spring. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITextField *textf =[[UITextField alloc]initWithFrame:CGRectMake(0, 0, 200, 100)];
    textf.center = self.view.center;
    [self.view addSubview:textf];
    textf.backgroundColor = [UIColor purpleColor];
    
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    [bt setBackgroundColor:[UIColor blackColor]];
    bt.frame = CGRectMake(10, 100, 100, 80);
    [self.view addSubview:bt];
    [bt addTarget:self action:@selector(printLog ) forControlEvents:UIControlEventTouchUpInside];

}
-(void)printLog
{
    [self.view endEditing:YES];
    UIWindow *topLevelWindow =[self topLevelWindowGet];
    
    NSLog(@"topLevelWindow:%@ level %.f",topLevelWindow,topLevelWindow.windowLevel);
}
-(UIWindow *)topLevelWindowGet
{
    UIWindow *topView = [UIApplication sharedApplication].keyWindow;
    for (UIWindow *win in [[UIApplication sharedApplication].windows  reverseObjectEnumerator]) {
        if ([win isEqual: topView]) {
            continue;
        }
        if (win.windowLevel > topView.windowLevel && win.hidden != YES ) {
            topView =win;
        }
    }
    return topView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
