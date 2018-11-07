//
//  RotateViewController.m
//  LayoutIntro
//
//  Copyright © 2018年 hormiga6. All rights reserved.
//

#import "RotateViewController.h"

@interface RotateViewController ()
@property (nonatomic) UIView *containerView;
@end

@implementation RotateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.containerView = [UIView new];
    self.containerView.translatesAutoresizingMaskIntoConstraints = NO;
    self.containerView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.containerView];
    NSLog(@"viewDidLoad");
}

- (void)setLayout1{
    NSLayoutConstraint *top =[NSLayoutConstraint
                              constraintWithItem:self.view
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.containerView
                              attribute:NSLayoutAttributeTop
                              multiplier:1
                              constant:0];
    [self.view addConstraint:top];

    NSLayoutConstraint *leading =[NSLayoutConstraint
                              constraintWithItem:self.view
                              attribute:NSLayoutAttributeLeading
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.containerView
                              attribute:NSLayoutAttributeLeading
                              multiplier:1
                              constant:0];
    [self.view addConstraint:leading];
    
    NSLayoutConstraint *trailing =[NSLayoutConstraint
                                  constraintWithItem:self.containerView
                                  attribute:NSLayoutAttributeTrailing
                                  relatedBy:NSLayoutRelationEqual
                                  toItem:self.view
                                  attribute:NSLayoutAttributeTrailing
                                  multiplier:1
                                  constant:0];
    [self.view addConstraint:trailing];

    NSLayoutConstraint *bottom =[NSLayoutConstraint
                                   constraintWithItem:self.view
                                   attribute:NSLayoutAttributeBottom
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:self.containerView
                                   attribute:NSLayoutAttributeBottom
                                   multiplier:1
                                   constant:0];
    [self.view addConstraint:bottom];
}




- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    NSLog(@"previous %@", previousTraitCollection);
    NSLog(@"current %@", self.traitCollection);
    [self setLayout1];
}
@end
