//
//  HomeTableViewController.m
//  LayoutIntro
//
//  Copyright © 2018年 hormiga6. All rights reserved.
//

#import "HomeTableViewController.h"
#import "RotateViewController.h"
#import "AnchorViewController.h"
#import "ViewTestViewController.h"

@interface HomeTableViewController ()
@property (nonatomic) NSArray *classNameList;
@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.classNameList = @[NSStringFromClass([RotateViewController class]),
                           NSStringFromClass([AnchorViewController class]),
                           NSStringFromClass([ViewTestViewController class]),
                           ];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.classNameList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homeItem" forIndexPath:indexPath];
    [cell.textLabel setText:self.classNameList[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =  [tableView cellForRowAtIndexPath:indexPath];
    UIViewController *vc = [[NSClassFromString(cell.textLabel.text) alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}
@end
