//
//  User.h
//  Random-Users-Hybrid
//
//  Created by Dongwoo Pae on 11/13/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_SWIFT_NAME(User)
@interface DWPUser: NSObject

@property (nonatomic, copy, readonly, nonnull) NSString *firstName;
@property (nonatomic, copy, readonly, nonnull) NSString *email;
@property (nonatomic, copy, readonly, nonnull) NSString *phoneNumber;
@property (nonatomic, copy, readonly, nonnull) NSString *imageURLString;

-(nonnull instancetype)initWithFirstName:(nonnull NSString *)firstName email:(nonnull NSString *)email phoneNumber:(nonnull NSString *)phoneNumber imageURLString:(nonnull NSString *)imageURLString;

-(nullable instancetype)initWithDictionary:(nonnull NSDictionary *)dictionary;

@end

