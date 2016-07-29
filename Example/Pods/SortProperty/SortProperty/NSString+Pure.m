//
//  NSString+Pure.m
//  搜索
//
//  Created by 王钱宝 on 16/7/11.
//  Copyright © 2016年 ellmcz. All rights reserved.
//

#import "NSString+Pure.h"

@implementation NSString (Pure)
/**
 *  判断是不是含有整性值
 *
 *  @param string 提供的字符串
 *
 *  @return 布尔值
 */
- (BOOL)pureIntWithString{
    NSScanner *scanner=[NSScanner scannerWithString:self];
    int val;
    return [scanner scanInt:&val]&&[scanner isAtEnd];
}
/**
 *  判断是不是含有浮点数
 *
 *  @param string 提供的字符串
 *
 *  @return 布尔值
 */
- (BOOL)pureFloatWithString{
    NSScanner *scanner=[NSScanner scannerWithString:self];
    float val;
    return [scanner scanFloat:&val]&&[scanner isAtEnd];
}
/**
 *  判断是不是含有Double
 *
 *  @param string 提供的字符串
 *
 *  @return 布尔值
 */
- (BOOL)pureDoubleWithString{
    NSScanner *scanner=[NSScanner scannerWithString:self];
    double val;
    return [scanner scanDouble:&val]&&[scanner isAtEnd];
    
}
/**
 *  判断是不是含有特殊的字符
 *
 *  @param string 提供的字符串
 *
 *  @return 布尔值
 */
- (BOOL)pureSpecialCharWithString{
    NSRange urgentRange = [self rangeOfCharacterFromSet: [NSCharacterSet characterSetWithCharactersInString: @",.？、 ~￥#&<>《》()[]{}【】^@/￡¤|§¨「」『』￠￢￣~@#&*（）——+|《》$_€"]];
    if (urgentRange.location != NSNotFound)
    {
        return YES;
    }else{
        return NO;
    }
    
}
@end
