//
//  SortPropertyHeader.h
//  Example
//
//  Created by MacBook Air on 16/7/26.
//  Copyright © 2016年 ellmcz. All rights reserved.
//

#ifndef SortPropertyHeader_h
#define SortPropertyHeader_h

#import "NSArray+Sort.h"
#import "NSString+Chinese.h"
#import "SortedProperty.h"
#import "NSMutableArray+Only.h"
#import "NSMutableArray+Sort.h"
#import "NSString+Pure.h"
#import "NSString+Property.h"

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
