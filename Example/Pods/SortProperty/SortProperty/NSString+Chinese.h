//
//  NSString+Chinese.h
//  Sort
//
//  Created by MacBook on 16/7/10.
//  Copyright © 2016年 ellmcz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Chinese)
///   通过汉字返回拼音 (Chinese)
@property (nonatomic, copy, readonly) NSString *pinYinString;
///    所有字母的拼音 (Chinese)
@property (nonatomic, copy, readonly) NSString *allUpperPinYinString;
///   通过汉字返回首字母 (Chinese)
@property (nonatomic, copy, readonly) NSString *subPinYinString;
///   通过所有汉字返回每个首字母 (Chinese)
@property (nonatomic, copy, readonly) NSString *subAllPinYinString;
///   通过汉字返回特殊首字母 (Chinese)
@property (nonatomic, copy,readonly) NSString *subFirstPinYinString;
@end
