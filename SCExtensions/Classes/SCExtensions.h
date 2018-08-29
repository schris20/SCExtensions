//
//  SCExtensions.h
//  SCExtensions
//
//  Created by apple on 04/10/17.
//  Copyright © 2017 schris. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SCExtensions : NSObject @end

@interface UIColor (OCExtension)
+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length;
+ (instancetype) colorWithHexString: (NSString *) hexString;
@end

@interface NSString (OCExtension)
- (NSString *)urlEncode;
+ (BOOL)isNullOrEmpty:(NSString*)input;
@end

@interface NSArray (OCExtension)
+ (BOOL)isNullOrEmpty:(NSArray*)input;
@end