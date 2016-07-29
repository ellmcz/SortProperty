//
//  NSString+Property.h
//  搜索
//
//  Created by 王钱宝 on 16/7/11.
//  Copyright © 2016年 ellmcz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Property)
/// 首字母 (Property)
@property (nonatomic, copy,readonly) NSString *propertyFirstPinYin;
/// 所有拼音 (Property)
@property (nonatomic, copy,readonly) NSString *propertyAllPinYin;
/// 每个汉字首字母 (Property)
@property (nonatomic, copy,readonly) NSString *propertySubAllPinYin;
/// 布尔值 (Property)
@property (nonatomic, copy,readonly) NSString *isBool;
@end
