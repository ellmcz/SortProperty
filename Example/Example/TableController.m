//
//  ViewController.m
//  SortChineseOrNumber
//
//  Created by 王钱宝 on 16/6/22.
//  Copyright © 2016年 ellmcz. All rights reserved.
//

#import "TableController.h"
#import "SortPropertyHeader.h"
#import "CompanyModel.h"
#import "CityModel.h"
#import "MJExtension.h"
@interface TableController ()
tableViewData_h()

@end

@implementation TableController
tableViewData_m()
tableViewDataSource_m()
tableViewSectionIndexTitle_m()
- (void)viewDidLoad {
    
    [super viewDidLoad];
    CompanyModel *companyModel=[[CompanyModel alloc]init];
    companyModel.title=@"搜狐";
    companyModel.month=@"2016年06月22日";
    companyModel.name=@"张朝阳";
    companyModel.rating=10;
    CompanyModel *companyModel1=[[CompanyModel alloc]init];
    companyModel1.title=@"百度";
     companyModel1.month=@"2016年03月22日";
    companyModel1.name=@"李彦宏";
    companyModel1.rating=9;
    CompanyModel *companyModel2=[[CompanyModel alloc]init];
    companyModel2.title=@"腾讯";
    companyModel2.month=@"2016年04月22日";
    companyModel2.rating=4;
    companyModel2.name=@"马化腾";
    CompanyModel *companyModel3=[[CompanyModel alloc]init];
    companyModel3.title=@"阿里巴巴";
     companyModel3.month=@"2016年02月22日";
    companyModel3.name=@"马云";
    companyModel3.rating=3;
    CompanyModel *companyModel4=[[CompanyModel alloc]init];
    companyModel4.title=@"网易";
     companyModel4.month=@"2016年01月22日";
    companyModel4.name=@"丁磊";
    companyModel4.rating=1;
    CompanyModel *companyModel5=[[CompanyModel alloc]init];
    companyModel5.title=@"苹果";
    companyModel5.rating=3;
    companyModel5.month=@"2016年02月22";
    companyModel5.name=@"乔布斯";
    CompanyModel *companyModel6=[[CompanyModel alloc]init];
    companyModel6.title=@"微软";
    companyModel6.rating=3;
    companyModel6.month=@"2016年02月22";
    companyModel6.name=@"比尔.盖茨";
    CompanyModel *companyModel7=[[CompanyModel alloc]init];
    companyModel7.title=@"伯克希尔.哈撒韦";
    companyModel7.rating=3;
    companyModel7.month=@"2016年03月22";
    companyModel7.name=@"巴菲特";
    CompanyModel *companyModel8=[[CompanyModel alloc]init];
    companyModel8.title=@"万科";
    companyModel8.rating=5;
    companyModel8.month=@"2016年09月22";
    companyModel8.name=@"王石";
    CompanyModel *companyModel9=[[CompanyModel alloc]init];
    companyModel9.title=@"中石油";
    companyModel9.rating=5;
    companyModel9.month=@"2016年09月22";
    companyModel9.name=@"傅成玉";
    CompanyModel *companyModel10=[[CompanyModel alloc]init];
    companyModel10.title=@"比亚迪";
    companyModel10.rating=5;
    companyModel10.month=@"2016年12月22";
    companyModel10.name=@"王传福";
    [self.data addObjectsFromArray:@[companyModel,companyModel1,companyModel2,companyModel3,companyModel4,companyModel5,companyModel6,companyModel7,companyModel8,companyModel9,companyModel10]];
    if (self.flag==1) {
        self.pinYinData=[SortedProperty sortedTitleStringWithArray:self.data PropertyName:@"name"];
        self.totalData=[SortedProperty sortedModelStringWithArray:self.data PinYinData:self.pinYinData PropertyName:@"name"];
    }
    
    if (self.flag==2) {
        self.pinYinData=[SortedProperty sortedTitleDateWithArray :self.data PropertyName:@"month"];
        self.totalData=[SortedProperty sortedModelDateWithArray:self.data PinYinData:self.pinYinData PropertyName:@"month"];
    }
    if (self.flag==3) {
      self.pinYinData=[SortedProperty sortedTitleRatingWithArray:self.data PropertyName:@"title" IsBoolPropertyName:@"rating" FirstTitle:@"热"];
      self.totalData=[SortedProperty sortedModelRatingWithArray:self.data PinYinData:self.pinYinData PropertyName:@"title" IsBoolPropertyName:@"rating"];
    }
    if (self.flag==4) {
        
        self.data=[CityModel mj_objectArrayWithFilename:@"chinacities.plist"];
        self.pinYinData=[SortedProperty sortedTitleCityWithString];
        self.totalData=[SortedProperty sortedCityModelCityWithArray:self.data PinYinData:self.pinYinData PropertyName:@"name"];
    }
    if (self.flag == 4) {
        self.title=@"城市选择";
    }else{
        self.title=@"城市选择";
    }
    self.tableView.sectionIndexColor=[UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1.0f];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    id model=self.totalData[indexPath.section][indexPath.row];
   if (self.flag==4) {
      cell.textLabel.text=[model valueForKey:@"name"];
    }else{
       cell.textLabel.text=[model valueForKey:@"title"];
        cell.detailTextLabel.text=[model valueForKey:@"name"];
    }

    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (self.flag==3) {
        if (section==0) {
           return @"热门公司";
        }else{
        return [NSString stringWithFormat:@"%@",self.pinYinData[section]];
        }
    }else{
        return [NSString stringWithFormat:@"%@",self.pinYinData[section]];
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     id model=self.totalData[indexPath.section][indexPath.row];
    NSLog(@"%@",model);
}
@end
