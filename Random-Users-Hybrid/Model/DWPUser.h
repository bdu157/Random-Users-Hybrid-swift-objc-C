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
@property (nonatomic, copy, nullable) NSString *email;
@property (nonatomic, copy, nullable) NSString *phoneNumber;
@property (nonatomic, copy, nullable) NSString *imageURLString;

-(nonnull instancetype)initWithFirstName:(nonnull NSString *)firstName email:(nullable NSString *)email phoneNumber:(nullable NSString *)phoneNumber imageURLString:(nullable NSString *)imageURLString;

-(nullable instancetype)initWithDictionary:(nonnull NSDictionary *)dictionary;

@end

