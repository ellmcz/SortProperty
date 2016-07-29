//
//  CompanyModel.h
//  SortChineseOrNumber
//
//  Created by 王钱宝 on 16/6/22.
//  Copyright © 2016年 ellmcz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SortPropertyHeader.h"
@interface CompanyModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *month;
@property (nonatomic, assign) int rating;
Property_hSubFirstPinYin(Title)
Property_hSubFirstPinYin(Name)
Property_hSubFirstPinYin(Month)
Property_hBool(Rating)
@end
