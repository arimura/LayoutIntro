//
//  AnchorViewController.m
//  LayoutIntro
//
//  Copyright © 2018年 hormiga6. All rights reserved.
//

#import "AnchorViewController.h"

@interface AnchorViewController ()
@property (nonatomic) UIView *containerView;
@end

@implementation AnchorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.containerView = [UIView new];
    self.containerView.translatesAutoresizingMaskIntoConstraints = NO;
    self.containerView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.containerView];
    [self setupAnchor];
    NSLog(@"viewDidLoad");
}

- (void)setupAnchor{
    [self.containerView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.containerView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.containerView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.containerView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}
@end
