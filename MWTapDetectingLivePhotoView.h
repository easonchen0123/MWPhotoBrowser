//
//  MWTapDetectingLivePhotoView.h
//  MWPhotoBrowser
//
//  Created based on MWTapDetectingImageView
//

#import <Foundation/Foundation.h>
#import <PhotosUI/PhotosUI.h>

@protocol MWTapDetectingImageViewDelegate;

@interface MWTapDetectingLivePhotoView : UIView

@property (nonatomic, strong) PHLivePhotoView *livePhotoView;
@property (nonatomic, weak) id <MWTapDetectingImageViewDelegate> tapDelegate;

@end

