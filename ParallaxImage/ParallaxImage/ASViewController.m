//
//  ASViewController.m
//  ParallaxImage
//
//  Created by Aditya Sinha on 13/11/13.
//  Copyright (c) 2013 Aditya Sinha. All rights reserved.
//

#import "ASViewController.h"
#import "ASParallaxView.h"

@interface ASViewController ()

@end

@implementation ASViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    ASParallaxView *pview = [[ASParallaxView alloc]initWithImage:[UIImage imageNamed:@"image62x.jpg"] andParallaxIntensityVertical:80 andParallaxIntensityHorizontal:80 withFrame:CGRectInset(self.view.bounds, 20, 80)];
    [self.view addSubview:pview];
    [pview setHorizontalParallaxIntensity:100];
    [pview setVerticalParallaxIntensity:250];
    [pview setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
