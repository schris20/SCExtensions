//
//  SCExtensions.m
//  SCExtensions
//
//  Created by apple on 04/10/17.
//  Copyright © 2017 schris. All rights reserved.
//

#import "SCExtensions.h"

@implementation SCExtensions @end

//UIColor Extension
@implementation UIColor (OCExtension)

+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}

+ (instancetype) colorWithHexString: (NSString *) hexString {
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [UIColor colorComponentFrom: colorString start: 0 length: 1];
            green = [UIColor colorComponentFrom: colorString start: 1 length: 1];
            blue  = [UIColor colorComponentFrom: colorString start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [UIColor colorComponentFrom: colorString start: 0 length: 1];
            red   = [UIColor colorComponentFrom: colorString start: 1 length: 1];
            green = [UIColor colorComponentFrom: colorString start: 2 length: 1];
            blue  = [UIColor colorComponentFrom: colorString start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [UIColor colorComponentFrom: colorString start: 0 length: 2];
            green = [UIColor colorComponentFrom: colorString start: 2 length: 2];
            blue  = [UIColor colorComponentFrom: colorString start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [UIColor colorComponentFrom: colorString start: 0 length: 2];
            red   = [UIColor colorComponentFrom: colorString start: 2 length: 2];
            green = [UIColor colorComponentFrom: colorString start: 4 length: 2];
            blue  = [UIColor colorComponentFrom: colorString start: 6 length: 2];
            break;
        default:
            return nil;
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}

@end

//NSString Extension
@implementation NSString (OCExtension)
- (NSString *)urlEncode {
    NSMutableString *output = [NSMutableString string];
    const unsigned char *source = (const unsigned char *)[self UTF8String];
    int sourceLen = (int)strlen((const char *)source);
    for (int i = 0; i < sourceLen; ++i) {
        const unsigned char thisChar = source[i];
        if (thisChar == ' '){
            [output appendString:@"+"];
        } else if (thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' ||
                   (thisChar >= 'a' && thisChar <= 'z') ||
                   (thisChar >= 'A' && thisChar <= 'Z') ||
                   (thisChar >= '0' && thisChar <= '9') ||
                   (thisChar == '/') || (thisChar=='?') ||
                   (thisChar == ':') || (thisChar=='=') ||
                   (thisChar == '&')) {
            [output appendFormat:@"%c", thisChar];
        } else {
            [output appendFormat:@"%%%02X", thisChar];
        }
    }
    return output;
}

+ (BOOL)isNullOrEmpty:(NSString*)input{
    NSString* string = input;
    if(string==nil || string==NULL){
        return YES;
    }
    if(string!=nil && string!=NULL && string.length==0){
        return YES;
    }
    if([string isEqualToString:@""]){
        return YES;
    }
    return NO;
}
@end

//NSArray Extension
@implementation NSArray (OCExtension)
+ (BOOL)isNullOrEmpty:(NSArray*)input{
    if(input==nil || input==NULL){
        return YES;
    }
    if(input!=nil && input!=NULL && input.count==0){
        return YES;
    }
    return NO;
}
@end

