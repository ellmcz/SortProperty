//
//  NSString+Chinese.m
//  Sort
//
//  Created by MacBook on 16/7/10.
//  Copyright © 2016年 ellmcz. All rights reserved.
//

#import "NSString+Chinese.h"
#import "NSString+Pure.h"
@implementation NSString (Chinese)

- (NSString *)pinYinString {
    NSAssert([self isKindOfClass:[NSString class]], @"必须是字符串");
    
    if (self == nil) {
        return nil;
    }
    
    NSMutableString *pinyin = [self mutableCopy];
    
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripDiacritics, NO);
    
    return pinyin;
}
- (NSString *)allUpperPinYinString{
    return [[self.pinYinString uppercaseString] stringByReplacingOccurrencesOfString:@" " withString:@""];
}
-(NSString *)subPinYinString{
    
    NSString  *pinyin=self.pinYinString;
    NSString*  pinYin=[pinyin uppercaseString];
    pinYin=[pinYin substringWithRange:NSMakeRange(0, 1)];
    return pinYin;
}
- (NSString *)subAllPinYinString{
    NSMutableString *str=[[NSMutableString alloc]init];
    for (int i = 0; i < self.length; ++i) {
        NSString *string=[NSString stringWithFormat:@"%C",[self characterAtIndex:i]];
        string=string.subPinYinString;
        [str appendString:string];
    }
    return str;
}

- (NSString *)subFirstPinYinString{
    NSString  *pinyin=self.pinYinString;
    NSString*  pinYin=[pinyin uppercaseString];
    pinYin=[pinYin substringWithRange:NSMakeRange(0, 1)];
    if([pinYin pureIntWithString]||[pinYin pureSpecialCharWithString]){
        pinYin=@"#";
    }
    return pinYin;
}


@end
