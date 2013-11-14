//
//  ASParallaxView.h
//  ParallaxImage
//
//  Created by Aditya Sinha on 13/11/13.
//  Copyright (c) 2013 Aditya Sinha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASParallaxView : UIView

@property (nonatomic, copy) UIImage *parallaxImage;
@property (nonatomic, assign) CGFloat horizontalParallaxIntensity;
@property (nonatomic, assign) CGFloat verticalParallaxIntensity;
@property (nonatomic) CGFloat motionEffects __attribute__((unavailable));

-(id)initWithImage:(UIImage *)anImage andParallaxIntensityVertical:(CGFloat)vertical andParallaxIntensityHorizontal:(CGFloat)horizontal withFrame:(CGRect)aFrame;

@end
