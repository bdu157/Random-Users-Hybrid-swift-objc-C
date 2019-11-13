//
//  DetailViewController.m
//  Random-Users-Hybrid
//
//  Created by Dongwoo Pae on 11/13/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

#import "DetailViewController.h"
#import "Random_Users_Hybrid-Swift.h"  //DWPUserController 
#import "DWPUser.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
}



#pragma mark - private methods
-(void)updateViews
{

}


//setter
-(void)setUser:(DWPUser *)user
{
    if(_user != user) {
        _user = user;
        [self updateViews];
    }
}


@end
