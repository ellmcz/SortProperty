//
//  NSArray+Sort.m
//  Sort
//
//  Created by MacBook on 16/7/10.
//  Copyright © 2016年 ellmcz. All rights reserved.
//

#import "NSArray+Sort.h"
#import "NSString+Chinese.h"
@implementation NSArray (Sort)
/**
 *  对于数组某一个属性，升序 (数组)
 *
 *  @param chineseKey 关键字
 *
 *  @return 排序之后的数组模型
 */
- (NSArray *)sortedArrayAscendingWithChineseKey:(NSString *)chineseKey {
    
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:self.count];
    
    for (int i = 0; i < self.count; ++i) {
        NSString *chineseString = (chineseKey == nil) ? self[i] : [self[i] valueForKeyPath:chineseKey];
        [tmpArray addObject:@{@"obj": self[i], @"pinyin": chineseString.pinYinString.lowercaseString}];
    }
    
    [tmpArray sortUsingComparator:^NSComparisonResult(NSDictionary *obj1, NSDictionary *obj2) {
        return [obj2[@"pinyin"] compare:obj1[@"pinyin"]];
    }];
    
    return [tmpArray valueForKey:@"obj"];;
}
/**
 *  对于数组某一个属性，降序 (数组)
 *
 *  @param chineseKey 关键字
 *
 *  @return 排序之后的数组模型
 */
- (NSArray *)sortedArrayDescendingWithChineseKey:(NSString *)chineseKey {
    
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:self.count];
    
    for (int i = 0; i < self.count; ++i) {
        NSString *chineseString = (chineseKey == nil) ? self[i] : [self[i] valueForKeyPath:chineseKey];
        [tmpArray addObject:@{@"obj": self[i], @"pinyin": chineseString.pinYinString.lowercaseString}];
    }
    [tmpArray sortUsingComparator:^NSComparisonResult(NSDictionary *obj1, NSDictionary *obj2) {
        return [obj1[@"pinyin"] compare:obj2[@"pinyin"]];
    }];
    
    return [tmpArray valueForKey:@"obj"];;
}

@end
