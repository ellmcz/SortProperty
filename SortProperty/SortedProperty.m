//
//  SortChineseProperty.m
//  SortChineseOrNumber
//
//  Created by 王钱宝 on 16/6/22.
//  Copyright © 2016年 ellmcz. All rights reserved.
//

#import "SortedProperty.h"
#import "NSMutableArray+Sort.h"
#import "NSArray+Sort.h"
#import "NSMutableArray+Only.h"
#import "NSString+Chinese.h"
#import "NSString+Property.h"
#import "NSString+Pure.h"
@implementation SortedProperty
#pragma mark ---------------------  热门  ---------------------------
/**
 *   为判断是否热门信息
 *
 *  @param rating 热门值
 *  @param min    至小热门值
 *
 *  @return 是否热门
 */
+ (BOOL)settingPropertyNameWithRating:(int)rating Min:(int)min{
    if (rating>min) {
        return YES;
    }else{
        return NO;
    }
}
#pragma mark ---------------------  字符串  ---------------------------

/**
 *  为排序模型属性的首字母进行排序（字符串）
 *
 *  @param data         需要排序的模型数组
 *  @param propertyName 需要排序的模型属性名
 *
 *  @return 排序的首字母
 */
+ (NSMutableArray *)sortedTitleStringWithArray:(NSMutableArray *)data PropertyName:(NSString *)propertyName{
    int flag=0;
    NSMutableArray *pinYinData=[[NSMutableArray alloc]init];
    data=[data sortedDescendingWithChineseKey:propertyName];
    propertyName=propertyName.propertyFirstPinYin;
    
    for (id m in data) {
        if (![[m valueForKey:propertyName] isEqualToString:@"#"]) {
            [pinYinData addObject:[m valueForKey:propertyName]];
        }else{
            flag=1;
        }
    }
    
    if (flag==1) {
        [pinYinData insertObject:@"#" atIndex:pinYinData.count];
        }
    
    return pinYinData.saveOnlyWithArray;
}
/**
 *  为排序模型属性的首字母进行排序，并且返回新模型数组（字符串）
 *
 *  @param data         需要排序的模型数组
 *  @param propertyName 需要排序的模型属性名
 *
 *  @return 排序完成之后新模型数组
 */
+ (NSMutableArray *)sortedModelStringWithArray:(NSMutableArray *)data PinYinData:(NSMutableArray*)pinYinData PropertyName:(NSString *)propertyName {
    propertyName=propertyName.propertyFirstPinYin;
    NSMutableArray *totalData=[[NSMutableArray alloc]init];
    for (int j = 0; j<pinYinData.count; j++) {
        @autoreleasepool {
        NSMutableArray *tempData = [[NSMutableArray alloc]init];
        NSString *alph = pinYinData[j];
        for (id model in data) {
            if ([alph isEqualToString:[model valueForKey:propertyName]]) {
                    [tempData addObject:model];
        }
    }
            
      [totalData addObject:tempData];
    }
        
    }
    return totalData;
}
#pragma mark ---------------------  字符串开头  ---------------------------
/**
*  为排序模型属性的首字母进行排序（字符串）
*
*  @param data         需要排序的模型数组
*  @param propertyName 需要排序的模型属性名
*
*  @return 排序的首字母
*/
+ (NSMutableArray *)sortedTitleStringWithArray:(NSMutableArray *)data PropertyName:(NSString *)propertyName IsBoolPropertyName:(NSString *)isBoolPropertyName FirstTitle:(NSString *)title{
    data=[self deteleConditonWithArray:data isBoolPropertyName:isBoolPropertyName.isBool];
    NSMutableArray *pinYinData=[self sortedTitleStringWithArray:data PropertyName:propertyName];
    
    [pinYinData insertObject:title atIndex:0];
    return pinYinData;
}
/**
 *  为排序模型属性的首字母进行排序，并且返回新模型数组（字符串）
 *
 *  @param data         需要排序的模型数组
 *  @param propertyName 需要排序的模型属性名
 *
 *  @return 排序完成之后新模型数组
 */
+ (NSMutableArray *)sortedModelStringWithArray:(NSMutableArray *)data PinYinData:(NSMutableArray*)pinYinData PropertyName:(NSString *)propertyName IsBoolPropertyName:(NSString *)isBoolPropertyName{
    propertyName=propertyName.propertyFirstPinYin;
    isBoolPropertyName=isBoolPropertyName.isBool;
    NSMutableArray *totalData=[[NSMutableArray alloc]init];
    NSMutableArray *firstArray=[self saveConditonWithArray:data isBoolPropertyName:isBoolPropertyName];
    firstArray=(NSMutableArray *)[firstArray sortedDescendingWithChineseKey:propertyName];
    NSMutableArray *lastArray=[self deteleConditonWithArray:data isBoolPropertyName:isBoolPropertyName];
    for (int j = 0; j<pinYinData.count; j++) {
        @autoreleasepool {
        NSMutableArray *tempData = [[NSMutableArray alloc]init];
        NSString *alph = pinYinData[j];
        for (id model in lastArray) {
        if ([alph isEqualToString:[model valueForKey:propertyName]]) {
                    [tempData addObject:model];
        }
      }
        [totalData addObject:tempData];
            
        }
    }
    [totalData insertObject:firstArray atIndex:0];
    [totalData removeObjectAtIndex:1];
    return totalData;
}
#pragma mark ---------------------  日期  ---------------------------
/**
 *  为新添加排序的模型属性赋值（字符串,数字）
 *
 *  @param dateType     日期的类型
 *  @param propertyName 模型属性名
 *
 *  @return  新添加排序的模型属性值
 */
+ (NSString *)settingPropertyNameDateWithDateTpye:(DateType)dateType  PropertyName:(NSString *)propertyName{

    int month;
    switch (dateType) {
        case DateTypeStanardYear:
            month=[self subDateTypeStanardYearWithString:propertyName];
            break;
        case DateTypeChineseYear:
            month=[self subDateTypeChineseYearWithString:propertyName];
            break;
        case DateTypeSpecialYear:
            month=[self subDateTypeaSpecialYearWithString:propertyName];
            break;
        case DateTypeStanardMonth:
            month=[self subDateTypeStanardMonthWithString:propertyName];
            break;
        case DateTypeChineseMonth:
            month=[self subDateTypeChineseMonthWithString:propertyName];
            break;
        case DateTypeSpecialMonth:
            month=[self subDateTypeaSpecialMonthWithString:propertyName];
            break;
        default:
            break;
    }
    return  [NSString stringWithFormat:@"%d",month];
}
/**
 *  为排序模型属性的日期进行排序（字符串,数字）
 *
 *  @param data         模型数组
 *  @param propertyName 排序的属性名
 *
 *  @return 日期中的月的数组
 */
+ (NSMutableArray *)sortedTitleDateWithArray:(NSMutableArray *)data PropertyName:(NSString *)propertyName{
    NSMutableArray *pinYinData=[[NSMutableArray alloc]init];
    data=[data sortedDescendingWithChineseKey:propertyName];
    propertyName=propertyName.propertyFirstPinYin;
    for (id m in data) {
        [pinYinData addObject:[m valueForKey:propertyName]];
    }
    return pinYinData.saveOnlyWithArray;
}
/**
 *  为排序模型属性的首字母进行排序，并且返回新模型数组（字符串,数字）
 *
 *  @param data         需要排序的模型数组
 *  @param propertyName 需要排序的模型属性名
 *
 *  @return 排序完成之后新模型数组
 */
+ (NSMutableArray *)sortedModelDateWithArray:(NSMutableArray *)data PinYinData:(NSMutableArray*)pinYinData PropertyName:(NSString *)propertyName{
    propertyName=propertyName.propertyFirstPinYin;
    NSMutableArray *totalData=[[NSMutableArray alloc]init];
    for (int j = 0; j<pinYinData.count; j++) {
        @autoreleasepool {
        NSMutableArray *tempData = [[NSMutableArray alloc]init];;
        NSString *alph = pinYinData[j];
        for (id model in data) {
           if ([alph isEqualToString:[model valueForKey:propertyName]]) {
                [tempData addObject:model];
            }
        }
       [totalData addObject:tempData];
            
        }
    }
    return totalData;
}
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
+ (NSMutableArray *)sortedTitleDateWithArray:(NSMutableArray *)data PropertyName:(NSString *)propertyName IsBoolPropertyName:(NSString *)isBoolPropertyName FirstTitle:(NSString *)title{
    isBoolPropertyName=isBoolPropertyName.isBool;
    data=[self deteleConditonWithArray:data isBoolPropertyName:isBoolPropertyName];
    NSMutableArray *array=[self sortedTitleDateWithArray:data PropertyName:propertyName];
    [array insertObject:title atIndex:0];
    return array;
}
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

+ (NSMutableArray *)sortedModelDateWithArray:(NSMutableArray *)data PinYinData:(NSMutableArray*)pinYinData PropertyName:(NSString *)propertyName IsBoolPropertyName:(NSString *)isBoolPropertyName{
    propertyName=propertyName.propertyFirstPinYin;
    isBoolPropertyName=isBoolPropertyName.isBool;
    NSMutableArray *totalData=[[NSMutableArray alloc]init];
    NSMutableArray *firstArray=[self saveConditonWithArray:data isBoolPropertyName:isBoolPropertyName];
    firstArray=(NSMutableArray *)[firstArray sortedDescendingWithChineseKey:propertyName];
    NSMutableArray *lastArray=[self deteleConditonWithArray:data isBoolPropertyName:isBoolPropertyName];

        for (int j = 0; j<pinYinData.count; j++) {
                @autoreleasepool {
            NSMutableArray *tempData = [[NSMutableArray alloc]init];
            NSString *alph = pinYinData[j];
            for (id model in lastArray) {
                if ([alph isEqualToString:[model valueForKey:propertyName]]) {
                    [tempData addObject:model];
                }
            }
            
            [totalData addObject:tempData];
            
        }
    }
    
    [totalData insertObject:firstArray atIndex:0];
    [totalData removeObjectAtIndex:1];
    
    return totalData;
    
}

#pragma mark --------------------- 城市  ---------------------------

/**
 *  为排序模型属性的首字母进行排序（城市）
 *
 *  @param title 需要排序的模型属性名
 *
 *  @return 排序的首字母
 */
+ (NSMutableArray *)sortedTitleCityWithString{
    NSMutableArray *pinYinData=[[NSMutableArray alloc]init];
    NSArray*arrayM=@[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"J",@"K",@"L",@"M",@"N",@"P",@"Q",@"R",@"S",@"T",@"W",@"X",@"Y",@"Z"];
    [pinYinData addObjectsFromArray:arrayM];
    return pinYinData;
}
/**
 *  为排序模型属性的首字母进行排序，并且返回新模型数组（城市）
 *
 *  @param data         需要排序的模型数组
 *  @param propertyName 需要排序的模型属性名
 *
 *  @return 排序完成之后新模型数组
 */
+ (NSMutableArray *)sortedCityModelCityWithArray:(NSMutableArray *)data PinYinData:(NSMutableArray*)pinYinData PropertyName:(NSString *)propertyName{
    propertyName=propertyName.propertyFirstPinYin;
    NSMutableArray *totalData=[[NSMutableArray alloc]init];
 
        for (int j = 0; j<pinYinData.count; j++) {
               @autoreleasepool {
            NSMutableArray *tempData = [[NSMutableArray alloc]init];;
            NSString *alph = pinYinData[j];
            for (int m = 0; m <data.count; m++) {
                id model = data[m];
                if ([alph isEqualToString:[model valueForKey:propertyName]]) {
                    [tempData addObject:model];
                }
            }
            [totalData addObject:tempData];
        }
    }
    return totalData;
}

#pragma mark ---------------------  服务器属性  ---------------------------

#pragma mark ---------------------  字符串和开头  ---------------------------

/**
 *  为排序模型属性的首字母进行排序（字符串）
 *
 *  @param data         需要排序的模型数组
 *  @param propertyName 需要排序的模型属性名
 *
 *  @return 排序的首字母
 */
+ (NSMutableArray *)sortedSelfTitleStringWithArray:(NSMutableArray *)data PropertyName:(NSString *)propertyName IsBoolPropertyName:(NSString *)isBoolPropertyName FirstTitle:(NSString *)title{
    data=[self deteleConditonWithArray:data isBoolPropertyName:isBoolPropertyName];
    NSMutableArray *pinYinData=[self sortedTitleStringWithArray:data PropertyName:propertyName];
    [pinYinData insertObject:title atIndex:0];
    return pinYinData;
}
/**
 *  为排序模型属性的首字母进行排序，并且返回新模型数组（字符串）
 *
 *  @param data         需要排序的模型数组
 *  @param propertyName 需要排序的模型属性名
 *
 *  @return 排序完成之后新模型数组
 */
+ (NSMutableArray *)sortedSelfModelStringWithArray:(NSMutableArray *)data PinYinData:(NSMutableArray*)pinYinData PropertyName:(NSString *)propertyName IsBoolPropertyName:(NSString *)isBoolPropertyName{
    propertyName=propertyName.propertyFirstPinYin;
    NSMutableArray *totalData=[[NSMutableArray alloc]init];
    NSMutableArray *firstArray=[self saveConditonWithArray:data isBoolPropertyName:isBoolPropertyName];
    firstArray=(NSMutableArray *)[firstArray sortedDescendingWithChineseKey:propertyName];
    NSMutableArray *lastArray=[self deteleConditonWithArray:data isBoolPropertyName:isBoolPropertyName];
        for (int j = 0; j<pinYinData.count; j++) {
            @autoreleasepool {
            NSMutableArray *tempData = [[NSMutableArray alloc]init];
            NSString *alph = pinYinData[j];
            for (id model in lastArray) {
                if ([alph isEqualToString:[model valueForKey:propertyName]]) {
                    [tempData addObject:model];
                }
            }
            [totalData addObject:tempData];
            
        }
    }
    [totalData insertObject:firstArray atIndex:0];
    
    [totalData removeObjectAtIndex:1];
    return totalData;
}

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
+ (NSMutableArray *)sortedSelfTitleDateWithArray:(NSMutableArray *)data PropertyName:(NSString *)propertyName FirstTitle:(NSString *)title{
    NSMutableArray *array=[self sortedTitleDateWithArray:data PropertyName:propertyName];
    [array insertObject:title atIndex:0];
    return array;
}

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
+ (NSMutableArray *)sortedSelfModelDateWithArray:(NSMutableArray *)data PinYinData:(NSMutableArray*)pinYinData PropertyName:(NSString *)propertyName IsBoolPropertyName:(NSString *)isBoolPropertyName{
    propertyName=propertyName.propertyFirstPinYin;
    NSMutableArray *totalData=[[NSMutableArray alloc]init];
    NSMutableArray *firstArray=[self saveConditonWithArray:data isBoolPropertyName:isBoolPropertyName];
    firstArray=(NSMutableArray *)[firstArray sortedDescendingWithChineseKey:propertyName];
    NSMutableArray *lastArray=[self deteleConditonWithArray:data isBoolPropertyName:isBoolPropertyName];
   
        for (int j = 0; j<pinYinData.count; j++) {
             @autoreleasepool {
            NSMutableArray *tempData = [[NSMutableArray alloc]init];
            
            NSString *alph = pinYinData[j];
            for (id model in lastArray) {
                if ([alph isEqualToString:[model valueForKey:propertyName]]) {
                    
                    [tempData addObject:model];
                }
            }
            [totalData addObject:tempData];
            
        }
    }
    [totalData insertObject:firstArray atIndex:0];
    [totalData removeObjectAtIndex:1];
    return totalData;
}


#pragma mark ---------------------  第两个参数 ---------------------------
#pragma mark ---------------------  城市  ---------------------------
+ (NSMutableArray *)sortedSelfTitleCityWithStringFirstTitle:(NSString *)title SecondTitle:(NSString *)subTitle{
    NSMutableArray *pinYinData=[[NSMutableArray alloc]init];
    NSArray*arrayM=[[NSArray alloc]init];
    if (!title&&!subTitle) {
        arrayM=@[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"J",@"K",@"L",@"M",@"N",@"P",@"Q",@"R",@"S",@"T",@"W",@"X",@"Y",@"Z"];
    }
    
    if (title&&subTitle) {
        arrayM=@[title,subTitle,@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"J",@"K",@"L",@"M",@"N",@"P",@"Q",@"R",@"S",@"T",@"W",@"X",@"Y",@"Z"];
    }
    
    if (!title&&subTitle) {
        arrayM=@[subTitle,@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"J",@"K",@"L",@"M",@"N",@"P",@"Q",@"R",@"S",@"T",@"W",@"X",@"Y",@"Z"];
    }
    if (title&&!subTitle) {
        arrayM=@[title,@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"J",@"K",@"L",@"M",@"N",@"P",@"Q",@"R",@"S",@"T",@"W",@"X",@"Y",@"Z"];
    }
    
    
    [pinYinData addObjectsFromArray:arrayM];
    return pinYinData;
}
/**
 *  为排序模型属性的首字母进行排序，并且返回新模型数组（城市）
 *
 *  @param data         需要排序的模型数组
 *  @param propertyName 需要排序的模型属性名
 *
 *  @return 排序完成之后新模型数组
 */
+ (NSMutableArray *)sortedSelfCityModelCityWithArray:(NSMutableArray *)data PinYinData:(NSMutableArray*)pinYinData PropertyName:(NSString *)propertyName FirstArray:(NSMutableArray *)firstArray SecondArray:(NSMutableArray *)secondArray{
    propertyName=propertyName.propertyFirstPinYin;
    NSMutableArray *totalData=[[NSMutableArray alloc]init];
  
        for (int j = 0; j<pinYinData.count; j++) {
              @autoreleasepool {
            NSMutableArray *tempData = [[NSMutableArray alloc]init];;
            NSString *alph = pinYinData[j];
            for (int m = 0; m <data.count; m++) {
                id model = data[m];
                if ([alph isEqualToString:[model valueForKey:propertyName]]) {
                    [tempData addObject:model];
                }
            }
            [totalData addObject:tempData];
        }
    }
    if (firstArray&&secondArray) {
        [totalData insertObject:firstArray atIndex:0];
        [totalData removeObjectAtIndex:1];
        [totalData insertObject:secondArray atIndex:1];
        [totalData removeObjectAtIndex:2];
    }
    
    if (!firstArray&&secondArray) {
        [totalData insertObject:secondArray atIndex:0];
        [totalData removeObjectAtIndex:1];
    }
    if (firstArray&&!secondArray) {
        [totalData insertObject:firstArray atIndex:0];
        [totalData removeObjectAtIndex:1];
    }
    
    return totalData;
    
}
#pragma mark ---------------------  私有方法  ---------------------------
#pragma mark ---------------------  删除相关的数组的元素  ---------------------------
/**
 *  通过删除某些元素
 *
 *  @param data               模型数组
 *  @param isBoolPropertyName  是不是需要删除
 *
 *  @return 新的模型数组
 */
+ (NSMutableArray *)deteleConditonWithArray:(NSMutableArray *)data isBoolPropertyName:(NSString *)isBoolPropertyName{
    NSMutableArray *arrayM=[[NSMutableArray alloc]init];
    for (id m in data) {
        if (![[m valueForKey:isBoolPropertyName]isEqual:@1]) {
            [arrayM addObject:m];
        }
    }
    return arrayM;
}
/**
 *  通过删除某些元素
 *
 *  @param data               模型数组
 *  @param isBoolPropertyName  是不是需要保存
 *
 *  @return 新的模型数组
 */
+ (NSMutableArray *)saveConditonWithArray:(NSMutableArray *)data isBoolPropertyName:(NSString *)isBoolPropertyName{
    NSMutableArray *arrayM=[[NSMutableArray alloc]init];
    for (id m in data) {
        if ([[m valueForKey:isBoolPropertyName]isEqual:@1]) {
            [arrayM addObject:m];
        }
        
    }
    return arrayM;
}


#pragma mark ---------------------  同一天  ---------------------------
/**
 *  判断是不是同一天
 *
 *  @param data         模型数组
 *  @param propertyName 属性名
 *
 *  @return 日期
 */
+ (NSMutableArray *)sortedTitleSameDateWithArray:(NSMutableArray *)data PropertyName:(NSString *)propertyName{
    data=[data sortedAscendingWithChineseKey:propertyName];
    NSMutableArray *pinYinData=[[NSMutableArray alloc]init];
    for (id m in data) {
        
        [pinYinData addObject:[m valueForKey:propertyName]];
    }
    

     pinYinData=pinYinData.saveOnlyWithArray;;
    
    return pinYinData;
}
/**
 *  判断是不是同一天,返回数组模型
 *
 *  @param data         模型数组
 *  @param pinYinData   日期
 *  @param propertyName 属性名
 *
 *  @return 新的模型数组
 */
+ (NSMutableArray *)sortedModelSameDateWithArray:(NSMutableArray *)data PinYinData:(NSMutableArray*)pinYinData PropertyName:(NSString *)propertyName{
    NSMutableArray *totalData=[[NSMutableArray alloc]init];
    @autoreleasepool {
        for (int j = 0; j<pinYinData.count; j++) {
            NSMutableArray *tempData = [[NSMutableArray alloc]init];;
            NSString *alph = pinYinData[j];
            for (int m = 0; m <data.count; m++) {
                id model = data[m];
                
                if ([alph isEqualToString:[model valueForKey:propertyName]]) {
                    
                    [tempData addObject:model];
                }
                
            }
            [totalData addObject:tempData];
            
        }
    }
    return totalData;
}

#pragma mark ---------------------截取年月日---------------------------
/**
 *  截取月的字符串（标准）
 *
 *  @param date 需要截取的字符串
 *
 *  @return  截取月的之后字符串
 */
+ (int)subDateTypeStanardYearWithString:(NSString *)date{
    int year,month,day;
    char * dates=(char *)[date UTF8String];
    sscanf(dates, "%d-%d-%d",&year,&month,&day);
    return month;
}
/**
 *  截取月的字符串（中国的日前）
 *
 *  @param date 需要截取的字符串
 *
 *  @return  截取月的之后字符串
 */
+ (int)subDateTypeChineseYearWithString:(NSString *)date{
    int year,month,day;
    const char* datas=[date UTF8String];
    sscanf(datas, "%d年%d月%d日",&year,&month,&day);
    return month;
}
/**
 *  截取月的字符串（特殊的日期）
 *
 *  @param date 需要截取的字符串
 *
 *  @return  截取月的之后字符串
 */
+ (int)subDateTypeaSpecialYearWithString:(NSString *)date{
    int year,month,day;
    const char* datas=[date UTF8String];
    sscanf(datas, "%d/%d/%d",&year,&month,&day);
    return month;
}
/**
 *  截取月的字符串（标准）
 *
 *  @param date 需要截取的字符串
 *
 *  @return  截取月的之后字符串
 */
+ (int)subDateTypeStanardMonthWithString:(NSString *)date{
    int month,day;
    char * dates=(char *)[date UTF8String];
    sscanf(dates, "%d-%d",&month,&day);
    return month;
}
/**
 *  截取月的字符串（中国的日前）
 *
 *  @param date 需要截取的字符串
 *
 *  @return  截取月的之后字符串
 */
+ (int)subDateTypeChineseMonthWithString:(NSString *)date{
    int month,day;
    const char* datas=[date UTF8String];
    sscanf(datas, "%d月%d日",&month,&day);
    return month;
}
/**
 *  截取月的字符串（中国的日前）
 *
 *  @param date 需要截取的字符串
 *
 *  @return  截取月的之后字符串
 */
+ (int)subDateTypeaSpecialMonthWithString:(NSString *)date{
    int month,day;
    const char* datas=[date UTF8String];
    sscanf(datas, "%d/%d",&month,&day);
    return month;
}

@end