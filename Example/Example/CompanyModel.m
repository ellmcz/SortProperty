//
//  CompanyModel.m
//  SortChineseOrNumber
//
//  Created by 王钱宝 on 16/6/22.
//  Copyright © 2016年 ellmcz. All rights reserved.
//

#import "CompanyModel.h"
@implementation CompanyModel
-(void)setTitle:(NSString *)title{
    _title=title;
    _propertyFirstPinYinTitle=title.subFirstPinYinString;
;
}
- (void)setMonth:(NSString *)month{
    _month=month;
    _propertyFirstPinYinMonth=[SortedProperty settingPropertyNameDateWithDateTpye:(DateTypeChineseYear) PropertyName:month];
   
}
- (void)setRating:(int)rating{
    _rating=rating;
    _isRating=[SortedProperty settingPropertyNameWithRating:rating Min:8];
}
-(void)setName:(NSString *)name{
    _name=name;
    _propertyFirstPinYinName=name.subFirstPinYinString;
}

@end
