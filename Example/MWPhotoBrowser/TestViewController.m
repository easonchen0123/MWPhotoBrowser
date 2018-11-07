//
//  TestViewController.m
//  MWPhotoBrowser_Example
//
//  Created by chenyijun on 2018/11/5.
//  Copyright © 2018 Michael Waterfall. All rights reserved.
//

#import "TestViewController.h"
#import <PhotosUI/PhotosUI.h>

@interface TestViewController ()

@property (nonatomic, strong) PHLivePhotoView *livePhotoView;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    _livePhotoView = [[PHLivePhotoView alloc] init];
    [_livePhotoView setFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width)];
    [self.view addSubview:_livePhotoView];
    
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"IMG_0283" ofType:@"HEIC"]];
//    NSString *path = [[[url path] stringByDeletingPathExtension] stringByAppendingPathExtension:@"mov"];
//    NSURL *movURL = [NSURL fileURLWithPath:path];
    NSURL *movURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"IMG_0283" ofType:@"mov"]];
    
    [PHLivePhoto requestLivePhotoWithResourceFileURLs:@[url, movURL]
                                     placeholderImage:nil
                                           targetSize:CGSizeMake(400, 400)
                                          contentMode:PHImageContentModeDefault
                                        resultHandler:^(PHLivePhoto * _Nullable livePhoto, NSDictionary * _Nonnull info) {
                                            
                                            self.livePhotoView.livePhoto = livePhoto;
                                            NSNumber *degradedKeyinfo = info[PHImageResultIsDegradedKey];
                                            if ([degradedKeyinfo boolValue] == NO) {
                                                [self.livePhotoView startPlaybackWithStyle:PHLivePhotoViewPlaybackStyleHint];
                                                [self.livePhotoView setHidden:NO];
                                            }
                                            
//                                            NSNumber *number = [info objectForKey:@"PHLivePhotoInfoIsDegradedKey"];
//                                            if ([number boolValue]) {
//                                                self.livePhotoView.livePhoto = livePhoto;
//                                                [self.livePhotoView startPlaybackWithStyle:PHLivePhotoViewPlaybackStyleHint];
//                                            }
                                            //                                                             _livePhoto = livePhoto;
                                            //                                                             int a = 0;
                                        }];
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
