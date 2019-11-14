//
//  DetailViewController.h
//  Random-Users-Hybrid
//
//  Created by Dongwoo Pae on 11/13/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DWPUser;
//@class DWPUserController; you do not need to since userController is static shared

@interface DetailViewController : UIViewController

//@property (nonatomic) DWPUserController *dwpUserController;
@property (nonatomic) DWPUser *user;

@end

