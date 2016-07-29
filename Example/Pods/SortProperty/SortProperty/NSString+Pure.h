//
//  NSString+Pure.h
//  搜索
//
//  Created by 王钱宝 on 16/7/11.
//  Copyright © 2016年 ellmcz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Pure)
/**
 *  判断是不是含有整形 (Pure)
 *
 *  @return 布尔值
 */
- (BOOL)pureIntWithString;
/**
 *  判断是不是含有浮点型 (Pure)
 *
 *  @return 布尔值
 */
- (BOOL)pureFloatWithString;
/**
 *  判断是不是含有Double (Pure)
 *
 *  @return 布尔值
 */
- (BOOL)pureDoubleWithString;
/**
 *  判断是不是含有特殊字符 (Pure)（,.？、 ~￥#&<>《》()[]{}【】^@/￡¤|§¨「」『』￠￢￣~@#&*（）——+|《》$_€）
 *
 *  @return 布尔值
 */
- (BOOL)pureSpecialCharWithString;
@end
