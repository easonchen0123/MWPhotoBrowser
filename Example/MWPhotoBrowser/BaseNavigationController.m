//
//  BaseNavigationController.m
//  MWPhotoBrowser_Example
//
//  Created by chenyijun on 2024/5/15.
//  Copyright © 2024 Michael Waterfall. All rights reserved.
//

#import "BaseNavigationController.h"
#import "MWPhotoBrowser/MWPhotoBrowser.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (BOOL)prefersStatusBarHidden {
    return self.topViewController.prefersStatusBarHidden;
//    return self.shouldHidden;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
