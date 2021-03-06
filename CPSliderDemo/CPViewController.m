//
//  CPViewController.m
//  CPSlider
//
//  Created by Charles Powell on 6/6/12.
//  Copyright (c) 2013 Charles Powell. All rights reserved.
//

#import "CPViewController.h"

#import "CPSlider.h"

@interface CPViewController ()

@end

@implementation CPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    CPSlider *slider = [[CPSlider alloc] initWithFrame:CGRectMake(30.0f, 100.0f, 260.0f, 23.0f)];
    [self.view addSubview:slider];
    self.slider = slider;
    
    self.slider.delegate = self;
    [slider addTarget:self action:@selector(sliderValueDidChange:) forControlEvents:UIControlEventValueChanged];
    
    self.slider.scrubbingSpeedPositions = @[@(0), @(50), @(125), @(200)];
    
    self.slider.scrubbingSpeeds = @[@(1.0f), @(0.5f), @(0.25f), @(0.1f)];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.slider = nil;
    self.resetButton = nil;
    self.positionLabel = nil;
    self.speedLabel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)sliderValueDidChange:(CPSlider *)sender {
    NSLog(@"%.5f", sender.value);
    self.positionLabel.text = [NSString stringWithFormat:@"%.5f", sender.value];
}

- (void)resetToCenter:(id)sender {
    self.slider.value = 0.5f;
    self.positionLabel.text = @"0.5f";
    self.speedLabel.text = [NSString stringWithFormat:@"%.3f", [(self.slider.scrubbingSpeeds)[0] floatValue]];
}

#pragma mark - Slider Delegate

- (void)slider:(CPSlider *)slider didChangeToSpeed:(CGFloat)speed whileTracking:(BOOL)tracking {
    self.speedLabel.text = [NSString stringWithFormat:@"%.3f", speed];
}

@end
