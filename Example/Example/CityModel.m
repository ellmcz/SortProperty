//
//  CityModel.m
//  SortChineseOrNumber
//
//  Created by 王钱宝 on 16/6/24.
//  Copyright © 2016年 ellmcz. All rights reserved.
//

#import "CityModel.h"

@implementation CityModel
-(void)setName:(NSString *)name{
    _name=name;
    _propertyFirstPinYinName=name.subFirstPinYinString;
    
}
- (BOOL)isEqual:(CityModel *)cityModel{
    return [self.name isEqual:cityModel.name];
}
@end
