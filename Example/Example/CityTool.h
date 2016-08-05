//
//  CityTool.h
//  Example
//
//  Created by MacBook Air on 16/8/4.
//  Copyright © 2016年 ellmcz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
@interface CityTool : NSObject
Singleton_h(CityTool)
@property (nonatomic,strong,readonly)NSMutableArray *city;
@end
