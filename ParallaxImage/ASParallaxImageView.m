//
//  ASParallaxView.m
//  ParallaxImage
//
//  Created by Aditya Sinha on 13/11/13.
//  Copyright (c) 2013 Aditya Sinha. All rights reserved.
//

#import "ASParallaxImageView.h"

@interface ASParallaxImageView ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ASParallaxImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setupParallaxWithImage:nil andParallaxIntensityVertical:0.0  andParallaxIntensityHorizontal:0.0 withFrame:frame];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupParallaxWithImage:nil andParallaxIntensityVertical:0.0 andParallaxIntensityHorizontal:0.0 withFrame:CGRectZero];
    }
    return self;
}

-(id)init{
    self = [super init];
    if (self) {
        [self setupParallaxWithImage:nil andParallaxIntensityVertical:0.0 andParallaxIntensityHorizontal:0.0 withFrame:CGRectZero];
    }
    return self;
}

-(id)initWithImage:(UIImage *)anImage andParallaxIntensityVertical:(CGFloat)vertical andParallaxIntensityHorizontal:(CGFloat)horizontal withFrame:(CGRect)aFrame
{
    self=[super initWithFrame:aFrame];
    if (self) {
        [self setupParallaxWithImage:anImage andParallaxIntensityVertical:vertical andParallaxIntensityHorizontal:horizontal withFrame:aFrame];
    }
    return self;
}

-(void) setupParallaxWithImage:(UIImage *)anImage andParallaxIntensityVertical:(CGFloat)vertical andParallaxIntensityHorizontal:(CGFloat)horizontal withFrame:(CGRect)aFrame
{
    [self setClipsToBounds:YES];  // so that image remains in the bounds of the view
    CGRect imageViewFrame = CGRectIntegral(CGRectInset(self.bounds, -horizontal, -vertical));
    self.imageView= [[UIImageView alloc]initWithFrame:imageViewFrame];
    [self addSubview:self.imageView];
    [self.imageView setClipsToBounds:NO];
    [self.imageView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFill];
    self.parallaxImage = anImage;
    UIInterpolatingMotionEffect *verticalMotionEffect =
    [[UIInterpolatingMotionEffect alloc]
     initWithKeyPath:@"center.y"
     type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    verticalMotionEffect.minimumRelativeValue = @(-vertical);
    verticalMotionEffect.maximumRelativeValue = @(vertical);
    _verticalParallaxIntensity=vertical;
    // Set horizontal effect
    UIInterpolatingMotionEffect *horizontalMotionEffect =
    [[UIInterpolatingMotionEffect alloc]
     initWithKeyPath:@"center.x"
     type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontalMotionEffect.minimumRelativeValue = @(-horizontal);
    horizontalMotionEffect.maximumRelativeValue = @(horizontal);
    _horizontalParallaxIntensity=horizontal;
    // Create group to combine both
    UIMotionEffectGroup *group = [UIMotionEffectGroup new];
    group.motionEffects = @[horizontalMotionEffect, verticalMotionEffect];
    [self.imageView addMotionEffect:group];
//    NSLog(@"Motion Effects: %@", self.motionEffects);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void) setParallaxImage:(UIImage *)parallaxImage
{
    if (_imageView) {
        _parallaxImage = parallaxImage;
        _imageView.image = parallaxImage;
    }
}

-(void) setHorizontalParallaxIntensity:(CGFloat)horizontalParallaxIntensity{
    if (_imageView) {
        NSLog(@"Motion Effects: %@", _imageView.motionEffects);
        UIMotionEffectGroup *group = _imageView.motionEffects[0];
        if (group) {
            for (UIInterpolatingMotionEffect *effect in group.motionEffects) {
                if (effect.type == UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis) {
                    effect.minimumRelativeValue=@(-horizontalParallaxIntensity);
                    effect.maximumRelativeValue=@(horizontalParallaxIntensity);
                    CGRect newFrame = CGRectIntegral(CGRectInset(self.bounds, -horizontalParallaxIntensity, -self.verticalParallaxIntensity));
                    self.imageView.frame = newFrame;
                    _horizontalParallaxIntensity=horizontalParallaxIntensity;

                }
            }
        }
    }
}

-(void) setVerticalParallaxIntensity:(CGFloat)verticalParallaxIntensity{
    if (_imageView) {
        NSLog(@"Motion Effects: %@", _imageView.motionEffects);
        UIMotionEffectGroup *group = _imageView.motionEffects[0];
        if (group) {
            for (UIInterpolatingMotionEffect *effect in group.motionEffects) {
                if (effect.type == UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis) {
                    effect.minimumRelativeValue=@(-verticalParallaxIntensity);
                    effect.maximumRelativeValue=@(verticalParallaxIntensity);
                    CGRect newFrame = CGRectIntegral(CGRectInset(self.bounds, -self.horizontalParallaxIntensity, -verticalParallaxIntensity));
                    self.imageView.frame = newFrame;
                    _verticalParallaxIntensity=verticalParallaxIntensity;

                }
            }
        }
    }
}


@end
