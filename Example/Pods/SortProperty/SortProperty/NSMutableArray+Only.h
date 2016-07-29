//
//  NSMutableArray+Only.h
//  Sort
//
//  Created by MacBook on 16/7/10.
//  Copyright © 2016年 ellmcz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Only)
/**
 *  删除数组中重复的元素 (Only)
 *
 *  @return 新数组
 */
- (NSMutableArray *)saveOnlyWithArray;
@end
