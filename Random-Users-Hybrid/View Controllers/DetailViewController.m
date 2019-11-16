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

//c pointer
void *KVOContext = &KVOContext;

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
    [DWPUserController.sharedController fillInUserWithUser:self.user];
}

#pragma mark - private methods
-(void)updateViews
{
    if (self.user) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.nameLabel.text = [self.user firstName];
            self.emailLabel.text = [self.user email];
            self.phoneNumberLabel.text = [self.user phoneNumber];
        });
        
        //give a conditional that you only fetch if there is image string from calling fillinperson method
        if (self.user.imageURLString) {
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
-(void)setUser:(DWPUser *)user
{
    //if old user is not same as new user here then assign old user (original user) to new user and updateViews
    if(user != _user) {
        
        NSLog(@"setting the user being triggers");
        
        [_user removeObserver:self forKeyPath:@"email" context:KVOContext];
        [_user removeObserver:self forKeyPath:@"phoneNumber" context:KVOContext];
        [_user removeObserver:self forKeyPath:@"imageURLString" context:KVOContext];
        
        NSLog(@"setting old user: %@ new user: %@", _user, user);
        //old user = Null
        _user = user;
        
        NSLog(@"setting old user: %@ new user: %@", _user, user);
        
        
        [_user addObserver:self forKeyPath:@"email" options:NSKeyValueObservingOptionInitial context:KVOContext];
        [_user addObserver:self forKeyPath:@"phoneNumber" options:NSKeyValueObservingOptionInitial context:KVOContext];
        [_user addObserver:self forKeyPath:@"imageURLString" options:NSKeyValueObservingOptionInitial context:KVOContext];
    }
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (context == KVOContext) {
        [self updateViews];
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

//add observe value for key path

//KVO for triggering updateviews only there is a update or change on properties, so if there is a update for email then it will trigger the update
//give an observe to do that


- (void)dealloc
{
    self.user = nil;
}
@end
