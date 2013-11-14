The-Parallax-Effect
===================

This module is aimed to provide parallax effect to the images in your app. This will be similar to the effect you get in the iOS 7 home screens (springboard) when you tilt the device at various angles.

Usage:

1. Import ASParallaxImageView .h and .m files to your project.
2. To create a parallax image view use create an ASParallaxImageViewObject using initWithImage:(UIImage *)anImage andParallaxIntensityVertical:(CGFloat)vertical andParallaxIntensityHorizontal:(CGFloat)horizontal withFrame:(CGRect)aFrame;
3. You may also change the parallax intensities later on by using setHorizontalParallaxIntensity or setVerticalParallaxIntensity.
4. Similarly the image can also be changed on the fly using setParallaxImage:(UIImage *)anImage;

Feel free to fork and extend the functionalities.

Cheers!
