//
//  User.m
//  Random-Users-Hybrid
//
//  Created by Dongwoo Pae on 11/13/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

#import "DWPUser.h"

@implementation DWPUser

- (instancetype)initWithFirstName:(NSString *)firstName email:(NSString *)email phoneNumber:(NSString *)phoneNumber imageURLString:(NSString *)imageURLString
{
    self = [super init];
    if (self) {
        _firstName = firstName.copy;
        _email = email.copy;
        _phoneNumber = phoneNumber.copy;
        _imageURLString = imageURLString.copy;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *firstName = dictionary[@"name"][@"first"];
//    NSString *email = dictionary[@"email"];
//    NSString *phoneNumber = dictionary[@"phone"];
//    NSString *imageURLString = dictionary[@"picture"][@"large"];
    
//    if (!firstName || !email || !phoneNumber || !imageURLString) {
//        return nil;
//    }
    return [self initWithFirstName:firstName email:@"" phoneNumber:@"" imageURLString:@""];
}


@end
