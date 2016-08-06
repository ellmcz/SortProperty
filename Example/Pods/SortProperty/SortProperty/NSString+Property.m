//
//  NSString+Property.m
//  搜索
//
//  Created by 王钱宝 on 16/7/11.
//  Copyright © 2016年 ellmcz. All rights reserved.
//

#import "NSString+Property.h"
@implementation NSString (Property)
-(NSString *)propertyFirstPinYin{
    NSString *begin=[self uppercaseString];
    begin =[begin substringToIndex:1];
    NSString *end =[self substringFromIndex:1];
    return [NSString stringWithFormat:@"propertyFirstPinYin%@%@",begin,end];
}
- (NSString *)propertyAllPinYin{
    NSString *begin=[self uppercaseString];
    begin =[begin substringToIndex:1];
    NSString *end =[self substringFromIndex:1];
    return [NSString stringWithFormat:@"propertyAllPinYin%@%@",begin,end];
}
-(NSString *)propertySubAllPinYin{
    NSString *begin=[self uppercaseString];
    begin =[begin substringToIndex:1];
    NSString *end =[self substringFromIndex:1];
    return [NSString stringWithFormat:@"propertySubAllPinYin%@%@",begin,end];
}
-(NSString *)isBool{
    NSString *begin=[self uppercaseString];
    begin =[begin substringToIndex:1];
    NSString * end =[self substringFromIndex:1];
    return [NSString stringWithFormat:@"is%@%@",begin,end];
}
@end
