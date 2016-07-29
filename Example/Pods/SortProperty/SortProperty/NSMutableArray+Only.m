//
//  NSMutableArray+Only.m
//  Sort
//
//  Created by MacBook on 16/7/10.
//  Copyright © 2016年 ellmcz. All rights reserved.
//

#import "NSMutableArray+Only.h"

@implementation NSMutableArray (Only)
- (NSMutableArray *)saveOnlyWithArray{
    NSMutableArray *categoryArray=[[NSMutableArray alloc]init];
    @autoreleasepool {
        for (int i = 0; i < self.count; ++i) {
            if ([categoryArray containsObject:[self objectAtIndex:i]]==NO) {
                [categoryArray addObject:[self objectAtIndex:i]];
            }
        }
    }
    return categoryArray;
}
@end
