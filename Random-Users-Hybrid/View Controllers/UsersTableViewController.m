//
//  UsersTableViewController.m
//  Random-Users-Hybrid
//
//  Created by Dongwoo Pae on 11/13/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

#import "UsersTableViewController.h"
#import "DWPUser.h"
#import "Random_Users_Hybrid-Swift.h"
#import "DetailViewController.h"

@interface UsersTableViewController ()

@property (nonatomic) NSArray<DWPUser *> *users;

@end

@implementation UsersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [DWPUserController.sharedController getUsers:100 completionHandler:^(NSArray<DWPUser *> *users, NSError *error) {
        if (error) {
            NSLog(@"Error getting Users - error: %@", error);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.users = users;
            [self.tableView reloadData];
        });
    }
     ];
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserCell" forIndexPath:indexPath];
    
    DWPUser *user = [self.users objectAtIndex:indexPath.row];
    cell.textLabel.text = user.firstName;
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ToUserDetail"]) {
        NSIndexPath *selectedRow = self.tableView.indexPathForSelectedRow;
        DetailViewController *detailVC = segue.destinationViewController;
        detailVC.user = [self.users objectAtIndex:selectedRow.row];
        }
    }
@end
