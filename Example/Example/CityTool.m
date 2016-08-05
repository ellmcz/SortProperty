//
//  CityTool.m
//  Example
//
//  Created by MacBook Air on 16/8/4.
//  Copyright © 2016年 ellmcz. All rights reserved.
//

#import "CityTool.h"
#import "CityModel.h"
#import "MJExtension.h"

@interface CityTool ()
@property (nonatomic,strong)NSMutableArray *data;
@end
@implementation CityTool

Singleton_m(CityTool);
- (NSMutableArray *)city{
    return [CityModel mj_objectArrayWithFilename:@"chinacities.plist"];
}
@end
