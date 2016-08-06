//
//  NSMutableArray+Sort.h
//  Sort
//
//  Created by MacBook on 16/7/10.
//  Copyright © 2016年 ellmcz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Sort)
/**
 *  对于数组某一个属性，升序 （可变数组）(Sort)
 *
 *  @param chineseKey 关键字
 *
 *  @return 排序之后的数组模型
 */
- (NSMutableArray *)sortedAscendingWithChineseKey:(NSString *)chineseKey;

/**
 *  对于数组某一个属性，降序  （可变数组）(Sort)
 *
 *  @param chineseKey 关键字
 *
 *  @return 排序之后的数组模型
 */
- (NSMutableArray *)sortedDescendingWithChineseKey:(NSString *)chineseKey ;


@end
