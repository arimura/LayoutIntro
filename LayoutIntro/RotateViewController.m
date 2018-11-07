//
//  RotateViewController.m
//  LayoutIntro
//
//  Copyright © 2018年 hormiga6. All rights reserved.
//

#import "RotateViewController.h"

@interface RotateViewController ()
@property (nonatomic) UIView *containerView;
@property (nonatomic) NSArray<NSLayoutConstraint*> *portraitConstraints;
@property (nonatomic) NSArray<NSLayoutConstraint*> *landscapeConstraints;
@end

@implementation RotateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.containerView = [UIView new];
    self.containerView.translatesAutoresizingMaskIntoConstraints = NO;
    self.containerView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.containerView];
    NSLog(@"viewDidLoad");
    
    if(@available(iOS 11, *)){
        __auto_type guide = self.view.safeAreaLayoutGuide;
        self.portraitConstraints = @[
                                     [self.containerView.topAnchor constraintEqualToAnchor:guide.topAnchor],
                                     [self.containerView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
                                     [self.containerView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
                                     [self.containerView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
                                     ];
        self.landscapeConstraints = @[
                                     [self.containerView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
                                     [self.containerView.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor],
                                     [self.containerView.trailingAnchor constraintEqualToAnchor:guide.trailingAnchor],
                                     [self.containerView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
                                     ];
    }
}

- (void)setLegacyLayout{
    [NSLayoutConstraint constraintWithItem:self.containerView
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.topLayoutGuide
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1
                                  constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:self.view
                                 attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.containerView
                                 attribute:NSLayoutAttributeLeading
                                multiplier:1
                                  constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:self.containerView
                                 attribute:NSLayoutAttributeTrailing
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeTrailing
                                multiplier:1
                                  constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:self.view
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.containerView
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1
                                  constant:0].active = YES;
}




- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    NSLog(@"previous %@", previousTraitCollection);
    NSLog(@"current %@", self.traitCollection);
    
    if(@available(iOS 11, *)){
        if(self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact){
            NSLog(@"=== Landscape ");
            [NSLayoutConstraint deactivateConstraints:self.portraitConstraints];
            [NSLayoutConstraint activateConstraints:self.landscapeConstraints];
        }else{
            NSLog(@"=== Portrait ");
            [NSLayoutConstraint deactivateConstraints:self.landscapeConstraints];
            [NSLayoutConstraint activateConstraints:self.portraitConstraints];
        }
    }else{
        [self setLegacyLayout];
    }
}
@end
