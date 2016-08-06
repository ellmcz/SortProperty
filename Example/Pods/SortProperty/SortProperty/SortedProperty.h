//
//  SortChineseProperty.h
//  SortChineseOrNumber
//
//  Created by 王钱宝 on 16/6/22.
//  Copyright © 2016年 ellmcz. All rights reserved.
//
#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, DateType){
    /// YYYY-MM-DD
    DateTypeStanardYear = 0 ,
    /// YYYY年MM月DD日
    DateTypeChineseYear,
    /// YYYY/MM/DD
    DateTypeSpecialYear,
    /// MM-DD
    DateTypeStanardMonth ,
    /// MM月DD日
    DateTypeChineseMonth,
    /// MM/DD
    DateTypeSpecialMonth
};
@interface SortedProperty : NSObject
#pragma mark ---------------------  热门  ---------------------------
/**
 *   为判断是否热门信息
 *
 *  @param rating 热门值
 *  @param min    至小热门值
 *
 *  @return 是否热门
 */
+ (BOOL)settingPropertyNameWithRating:(int)rating Min:(int)min;
#pragma mark --------------------- 字符串  ---------------------------
/**
 *  为排序模型属性的首字母进行排序（字符串）
 *
 *  @param data         需要排序的模型数组
 *  @param propertyName 需要排序的模型属性名
 *
 *  @return 排序的首字母
 */
+ (NSMutableArray *)sortedTitleStringWithArray:(NSMutableArray *)data PropertyName:(NSString *)propertyName;
/**
 *  为排序模型属性的首字母进行排序，并且返回新模型数组（字符串）
 *
 *  @param data         需要排序的模型数组
 *  @param propertyName 需要排序的模型属性名
 *
 *  @return 排序完成之后新模型数组
 */
+ (NSMutableArray *)sortedModelStringWithArray:(NSMutableArray *)data PinYinData:(NSMutableArray*)pinYinData PropertyName:(NSString *)propertyName;
#pragma mark ---------------------  字符串和开头 ---------------------------
/**
 *  为排序模型属性的首字母进行排序（字符串）
 *
 *  @param data         需要排序的模型数组
 *  @param propertyName 需要排序的模型属性名
 *
 *  @return 排序的首字母
 */
+ (NSMutableArray *)sortedTitleStringWithArray:(NSMutableArray *)data PropertyName:(NSString *)propertyName IsBoolPropertyName:(NSString *)isBoolPropertyName FirstTitle:(NSString *)title;
/**
 *  为排序模型属性的首字母进行排序，并且返回新模型数组（字符串）
 *
 *  @param data         需要排序的模型数组
 *  @param propertyName 需要排序的模型属性名
 *
 *  @return 排序完成之后新模型数组
 */
+ (NSMutableArray *)sortedModelStringWithArray:(NSMutableArray *)data PinYinData:(NSMutableArray*)pinYinData PropertyName:(NSString *)propertyName IsBoolPropertyName:(NSString *)isBoolPropertyName;

#pragma mark --------------------- 日期 ---------------------------
/**
 *  为新添加排序的模型属性赋值（字符串,数字）
 *
 *  @param dateType     日期的类型
 *  @param propertyName 模型属性名
 *
 *  @return  新添加排序的模型属性值
 */
+ (NSString*)settingPropertyNameDateWithDateTpye:(DateType)dateType PropertyName:(NSString *)propertyName;
/**
 *  为排序模型属性的日期进行排序（字符串,数字）
 *
 *  @param data         模型数组
 *  @param propertyName 排序的属性名
 *
 *  @return 日期中的月的数组
 */
+ (NSMutableArray *)sortedTitleDateWithArray:(NSMutableArray *)data PropertyName:(NSString *)propertyName;
/**
 *  为排序模型属性的首字母进行排序，并且返回新模型数组（字符串,数字）
 *
 *  @param data         需要排序的模型数组
 *  @param propertyName 需要排序的模型属性名
 *
 *  @return 排序完成之后新模型数组
 */
+ (NSMutableArray *)sortedModelDateWithArray:(NSMutableArray *)data PinYinData:(NSMutableArray*)pinYinData PropertyName:(NSString *)propertyName;
#pragma mark ---------------------  日期和开头  ---------------------------
/**
 *  通过日期，开头信息是重新设置
 *
 *  @param data         模型数组
 *  @param propertyName 属性名
 *  @param title        第一个标题
 *
 *  @return 拼音的数字
 */
+ (NSMutableArray *)sortedTitleDateWithArray:(NSMutableArray *)data PropertyName:(NSString *)propertyName  IsBoolPropertyName:(NSString *)isBoolPropertyName FirstTitle:(NSString *)title;

/**
 *  通过模型数组返回新的模型数组
 *
 *  @param data               模型数组
 *  @param pinYinData         拼音数组
 *  @param propertyName       属性名
 *  @param isBoolPropertyName 判断的属性名
 *
 *  @return 新的模型数组
 */
+ (NSMutableArray *)sortedModelDateWithArray:(NSMutableArray *)data PinYinData:(NSMutableArray*)pinYinData PropertyName:(NSString *)propertyName IsBoolPropertyName:(NSString *)isBoolPropertyName;


#pragma mark --------------------- 城市  ---------------------------
/**
 *  为排序模型属性的首字母进行排序（城市）
 *
 *  @param title 需要排序的模型属性名
 *
 *  @return 排序的首字母
 */
+ (NSMutableArray *)sortedTitleCityWithString;
/**
 *  为排序模型属性的首字母进行排序，并且返回新模型数组（城市）
 *
 *  @param data         需要排序的模型数组
 *  @param propertyName 需要排序的模型属性名
 *
 *  @return 排序完成之后新模型数组
 */
+ (NSMutableArray *)sortedCityModelCityWithArray:(NSMutableArray *)data PinYinData:(NSMutableArray*)pinYinData PropertyName:(NSString *)propertyName;

#pragma mark ---------------------  服务器属性  ---------------------------

#pragma mark ---------------------  字符串和开头 ---------------------------
/**
 *  为排序模型属性的首字母进行排序（字符串）
 *
 *  @param data         需要排序的模型数组
 *  @param propertyName 需要排序的模型属性名
 *
 *  @return 排序的首字母
 */
+ (NSMutableArray *)sortedSelfTitleStringWithArray:(NSMutableArray *)data PropertyName:(NSString *)propertyName IsBoolPropertyName:(NSString *)isBoolPropertyName FirstTitle:(NSString *)title;
/**
 *  为排序模型属性的首字母进行排序，并且返回新模型数组（字符串）
 *
 *  @param data         需要排序的模型数组
 *  @param propertyName 需要排序的模型属性名
 *
 *  @return 排序完成之后新模型数组
 */
+ (NSMutableArray *)sortedSelfModelStringWithArray:(NSMutableArray *)data PinYinData:(NSMutableArray*)pinYinData PropertyName:(NSString *)propertyName IsBoolPropertyName:(NSString *)isBoolPropertyName;

#pragma mark ---------------------  日期和开头  ---------------------------
/**
 *  通过日期，开头信息是重新设置
 *
 *  @param data         模型数组
 *  @param propertyName 属性名
 *  @param title        第一个标题
 *
 *  @return 拼音的数字
 */
+ (NSMutableArray *)sortedSelfTitleDateWithArray:(NSMutableArray *)data PropertyName:(NSString *)propertyName FirstTitle:(NSString *)title;

/**
 *  通过模型数组返回新的模型数组
 *
 *  @param data               模型数组
 *  @param pinYinData         拼音数组
 *  @param propertyName       属性名
 *  @param isBoolPropertyName 判断的属性名
 *
 *  @return 新的模型数组
 */
+ (NSMutableArray *)sortedSelfModelDateWithArray:(NSMutableArray *)data PinYinData:(NSMutableArray*)pinYinData PropertyName:(NSString *)propertyName IsBoolPropertyName:(NSString *)isBoolPropertyName;

#pragma mark ---------------------  城市和开头  ---------------------------
+ (NSMutableArray *)sortedSelfTitleCityWithStringFirstTitle:(NSString *)titleString SecondTitle:(NSString *)secondTitle;
/**
 *  为排序模型属性的首字母进行排序，并且返回新模型数组（城市）
 *
 *  @param data         需要排序的模型数组
 *  @param propertyName 需要排序的模型属性名
 *
 *  @return 排序完成之后新模型数组
 */
+ (NSMutableArray *)sortedSelfCityModelCityWithArray:(NSMutableArray *)data PinYinData:(NSMutableArray*)pinYinData PropertyName:(NSString *)propertyName FirstArray:(NSMutableArray *)firstArray SecondArray:(NSMutableArray *)secondArray;
#pragma mark ---------------------  同一天  ---------------------------
/**
 *  判断是不是同一天
 *
 *  @param data         模型数组
 *  @param propertyName 属性名
 *
 *  @return 日期
 */
+ (NSMutableArray *)sortedTitleSameDateWithArray:(NSMutableArray *)data PropertyName:(NSString *)propertyName;
/**
 *  判断是不是同一天,返回数组模型
 *
 *  @param data         模型数组
 *  @param pinYinData   日期
 *  @param propertyName 属性名
 *
 *  @return 新的模型数组
 */
+ (NSMutableArray *)sortedModelSameDateWithArray:(NSMutableArray *)data PinYinData:(NSMutableArray*)pinYinData PropertyName:(NSString *)propertyName;
@end
