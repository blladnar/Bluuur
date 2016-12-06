//
//  MLWViewController.m
//  Bluuur
//
//  Created by Anton Bukov on 05/27/2016.
//  Copyright (c) 2016 Anton Bukov. All rights reserved.
//

#import <Bluuur/Bluuur.h>

#import "MLWViewController.h"

@interface MLWViewController ()

@property (weak, nonatomic) IBOutlet MLWLiveBlurView *blurView;
@property (weak, nonatomic) IBOutlet UILabel *dragMe;

@end

@implementation MLWViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.blurView.blurProgress = 0.1;

    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
        self.dragMe.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.5, 1.5);
    } completion:nil];
}

- (IBAction)radiusChanged:(UISlider *)sender {
    self.blurView.blurProgress = sender.value;
}

- (IBAction)pan:(UIPanGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateBegan ||
        recognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint move = [recognizer translationInView:self.view];
        self.blurView.transform = CGAffineTransformMakeTranslation(move.x, move.y);
    }
    else {
        self.blurView.transform = CGAffineTransformIdentity;
    }
}

@end
