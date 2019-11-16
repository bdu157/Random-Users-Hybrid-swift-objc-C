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

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateViews];
    
    //call fillinperson for person so when you pass person from maintableviewcontroller to here so it can fill the rest properties for these to be used in detail view controller
}

#pragma mark - private methods
-(void)updateViews
{
    if (self.user) {
        self.nameLabel.text = [self.user firstName];
        self.emailLabel.text = [self.user email];
        self.phoneNumberLabel.text = [self.user phoneNumber];
        
        //give a conditional that you only fetch if there is image string from calling fillinperson method
        
        if (![self.user.imageURLString isEqual: @""]) {
            [DWPUserController.sharedController fetchImagesWithimageURLString:self.user.imageURLString completionHandler:^(UIImage *image, NSError *error) {
                if (error) {
                    NSLog(@"Error in fetching images: %@", error);
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.userImageView.image = image;
                });
            }];
        }
    }
}

//setter - add observer
//-(void)setUser:(DWPUser *)user
//{
//    //if old user is not same as new user here then assign old user (original user) to new user and updateViews
//    if(_user != user) {
//        _user = user;
//        [self updateViews];
//    }
//}

//add observe value for key path

//KVO for triggering updateviews only there is a update or change on properties, so if there is a update for email then it will trigger the update
//give an observe to do that

@end
