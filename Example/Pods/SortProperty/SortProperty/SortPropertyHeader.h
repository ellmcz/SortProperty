//
//  SortPropertyHeader.h
//  Example
//
//  Created by MacBook Air on 16/7/26.
//  Copyright © 2016年 ellmcz. All rights reserved.
//

#ifndef SortPropertyHeader_h
#define SortPropertyHeader_h
#if __has_include(<SortPropertyHeader/SortPropertyHeader.h>)
FOUNDATION_EXPORT double SortPropertyVersion;
FOUNDATION_EXPORT const unsigned char SortPropertyVersionString[];
#import <SortPropertyHeader/NSArray+Sort.h>
#import <SortPropertyHeader/NSString+Chinese.h>
#import <SortPropertyHeader/NSMutableArray+Only.h>
#import <SortPropertyHeader/NSString+Pure.h>
#import <SortPropertyHeader/NSString+Property.h>
#import <SortPropertyHeader/SortedProperty.h>
#import <SortPropertyHeader/NSMutableArray+Sort.h>
#else
#import "NSArray+Sort.h"
#import "NSString+Chinese.h"
#import "SortedProperty.h"
#import "NSMutableArray+Only.h"
#import "NSMutableArray+Sort.h"
#import "NSString+Pure.h"
#import "NSString+Property.h"
#endif

#if __has_include(<SortPropertyHeader/SortPropertyHeader.h>)
#import <SortPropertyHeader/SortPropertyHeader.h>
#elif __has_include(<SortPropertyHeader/SortPropertyHeader.h>)
#import <SortPropertyHeader/NSArray+Sort.h>
#import <SortPropertyHeader/NSString+Chinese.h>
#import <SortPropertyHeader/NSMutableArray+Only.h>
#import <SortPropertyHeader/NSString+Pure.h>
#import <SortPropertyHeader/NSString+Property.h>
#import <SortPropertyHeader/SortedProperty.h>
#import <SortPropertyHeader/NSMutableArray+Sort.h>
#else
#import "NSArray+Sort.h"
#import "NSString+Chinese.h"
#import "SortedProperty.h"
#import "NSMutableArray+Only.h"
#import "NSMutableArray+Sort.h"
#import "NSString+Pure.h"
#import "NSString+Property.h"
#endif

#if __has_include(<SortPropertyHeader/SortPropertyHeader.h>)
#import <YYCache/YYCache.h>
#elif __has_include(<SortPropertyHeader/SortPropertyHeader.h>)
#import <SortPropertyHeader/NSArray+Sort.h>
#import <SortPropertyHeader/NSString+Chinese.h>
#import <SortPropertyHeader/NSMutableArray+Only.h>
#import <SortPropertyHeader/NSString+Pure.h>
#import <SortPropertyHeader/NSString+Property.h>
#import <SortPropertyHeader/SortedProperty.h>
#import <SortPropertyHeader/NSMutableArray+Sort.h>
#else
#import "NSArray+Sort.h"
#import "NSString+Chinese.h"
#import "SortedProperty.h"
#import "NSMutableArray+Only.h"
#import "NSMutableArray+Sort.h"
#import "NSString+Pure.h"
#import "NSString+Property.h"
#endif

////
#define Property_hSubFirstPinYin(Name)  @property (nonatomic, copy) NSString *propertyFirstPinYin##Name;
#define Property_hBool(Name)    @property (nonatomic, assign) BOOL is##Name;
#define Property_hAllPigYin(Name)  @property (nonatomic, copy) NSString *propertyAllPinYin##Name;
#define Property_hSubAllPigYin(Name)  @property (nonatomic, copy) NSString *propertySubAllPinYin##Name;
#define tableViewData_h()\
@property (nonatomic, strong) NSMutableArray *pinYinData;\
@property (nonatomic, strong) NSMutableArray *totalData;\
@property (nonatomic, strong) NSMutableArray *data;
//
#define tableViewData_m()\
-(NSMutableArray *)data{\
if (!_data ) {\
_data = [[NSMutableArray alloc] init];\
}\
return _data;\
}\
-(NSMutableArray *)pinYinData{\
if (!_pinYinData ) {\
_pinYinData = [[NSMutableArray alloc] init];\
}\
return _pinYinData;\
}\
- (NSMutableArray *)totalData{\
if (!_totalData ) {\
_totalData = [[NSMutableArray alloc] init];\
}\
return _totalData;\
}\
//
#define tableViewDataSource_m()\
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{\
return self.totalData.count;\
}\
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{\
return [self.totalData[section] count];\
}
//
#define tableViewSectionIndexTitle_m()\
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{\
return [self.pinYinData copy];\
}
#endif /* SortPropertyHeader_h */
