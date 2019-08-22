//
//  ViewTestViewController.m
//  LayoutIntro
//
//  Copyright © 2019 hormiga6. All rights reserved.
//

#import "ViewTestViewController.h"

@interface ViewTestViewController ()
@property (nonatomic) UIView *smallView1;
@property (nonatomic) UIView *smallView2;
@end

@implementation ViewTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");

    //add view
    self.smallView1 = [self generateSmallView];
    self.smallView1.frame = CGRectMake(0, 0, self.smallView1.frame.size.width, self.smallView1.frame.size.height);
    self.view.backgroundColor = UIColor.whiteColor;
    self.smallView1.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.smallView1];

    //add view
    self.smallView2 = [self generateSmallView];
    self.smallView2.frame = CGRectMake(10, 250, self.smallView2.frame.size.width, self.smallView2.frame.size.height);
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.smallView2];

    //add constraint on view1
    [NSLayoutConstraint constraintWithItem:self.smallView1
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.topLayoutGuide
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1
                                  constant:40].active = YES;

    [NSLayoutConstraint constraintWithItem:self.smallView1
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1
                                  constant:100].active = YES;

    [NSLayoutConstraint constraintWithItem:self.smallView1
                                 attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeLeading
                                multiplier:1
                                  constant:40].active = YES;

    [NSLayoutConstraint constraintWithItem:self.smallView1
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1
                                  constant:100].active = YES;
}

- (UIView *)generateSmallView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    view.backgroundColor = [UIColor redColor];
    return view;
}
@end
