//
//  MWTapDetectingLivePhotoView.m
//  MWPhotoBrowser
//
//  Created based on MWTapDetectingImageView
//

#import "MWTapDetectingLivePhotoView.h"
#import "MWTapDetectingImageView.h"

@implementation MWTapDetectingLivePhotoView

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        self.userInteractionEnabled = YES;
        
        // Create and add PHLivePhotoView
        if (@available(iOS 9.1, *)) {
            _livePhotoView = [[PHLivePhotoView alloc] initWithFrame:self.bounds];
            _livePhotoView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            _livePhotoView.userInteractionEnabled = NO; // We handle interactions at the container level
            [self addSubview:_livePhotoView];
            
            // Add long press gesture recognizer to enable Live Photo playback
            UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
            longPressGesture.minimumPressDuration = 0.3; // Standard long press duration
            longPressGesture.cancelsTouchesInView = NO; // Don't cancel touches to allow tap detection
            longPressGesture.allowableMovement = 10.0; // Allow some movement during long press
            [self addGestureRecognizer:longPressGesture];
        }
    }
    return self;
}

- (id)init {
    if ((self = [super init])) {
        self.userInteractionEnabled = YES;
        
        // Create and add PHLivePhotoView
        if (@available(iOS 9.1, *)) {
            _livePhotoView = [[PHLivePhotoView alloc] init];
            _livePhotoView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            _livePhotoView.userInteractionEnabled = NO; // We handle interactions at the container level
            [self addSubview:_livePhotoView];
            
            // Add long press gesture recognizer to enable Live Photo playback
            UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
            longPressGesture.minimumPressDuration = 0.3; // Standard long press duration
            longPressGesture.cancelsTouchesInView = NO; // Don't cancel touches to allow tap detection
            longPressGesture.allowableMovement = 10.0; // Allow some movement during long press
            [self addGestureRecognizer:longPressGesture];
        }
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (_livePhotoView) {
        _livePhotoView.frame = self.bounds;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    NSUInteger tapCount = touch.tapCount;
    switch (tapCount) {
        case 1:
            [self handleSingleTap:touch];
            break;
        case 2:
            [self handleDoubleTap:touch];
            break;
        case 3:
            [self handleTripleTap:touch];
            break;
        default:
            break;
    }
    [[self nextResponder] touchesEnded:touches withEvent:event];
}

- (void)handleSingleTap:(UITouch *)touch {
    // Use the same delegate protocol as MWTapDetectingImageView
    // Pass self cast to UIImageView* for protocol compatibility
    // The delegate can use locationInView: with any UIView, so this should work
    if ([_tapDelegate respondsToSelector:@selector(imageView:singleTapDetected:)]) {
        [_tapDelegate imageView:(UIImageView *)self singleTapDetected:touch];
    }
}

- (void)handleDoubleTap:(UITouch *)touch {
    if ([_tapDelegate respondsToSelector:@selector(imageView:doubleTapDetected:)]) {
        [_tapDelegate imageView:(UIImageView *)self doubleTapDetected:touch];
    }
}

- (void)handleTripleTap:(UITouch *)touch {
    if ([_tapDelegate respondsToSelector:@selector(imageView:tripleTapDetected:)]) {
        [_tapDelegate imageView:(UIImageView *)self tripleTapDetected:touch];
    }
}

- (void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer {
    if (@available(iOS 9.1, *)) {
        if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
            // Start Live Photo playback when long press begins
            if (_livePhotoView.livePhoto) {
                [_livePhotoView startPlaybackWithStyle:PHLivePhotoViewPlaybackStyleFull];
            }
        } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded || 
                   gestureRecognizer.state == UIGestureRecognizerStateCancelled) {
            // Stop playback when long press ends
            [_livePhotoView stopPlayback];
        }
    }
}

// Forward PHLivePhotoView properties
- (PHLivePhoto *)livePhoto {
    if (@available(iOS 9.1, *)) {
        return _livePhotoView.livePhoto;
    }
    return nil;
}

- (void)setLivePhoto:(PHLivePhoto *)livePhoto {
    if (@available(iOS 9.1, *)) {
        _livePhotoView.livePhoto = livePhoto;
    }
}

- (void)startPlaybackWithStyle:(PHLivePhotoViewPlaybackStyle)playbackStyle {
    if (@available(iOS 9.1, *)) {
        [_livePhotoView startPlaybackWithStyle:playbackStyle];
    }
}

- (void)stopPlayback {
    if (@available(iOS 9.1, *)) {
        [_livePhotoView stopPlayback];
    }
}

@end

