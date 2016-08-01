# SortProperty
排序

=========

Easy to drop into your project.      

You can add this feature to your own project, 'SortProperty' is easy-to-use.        

## Requirements ##

PathCover requires Xcode 5, targeting either iOS 5.0 and above, ARC-enabled.      

## 1.Profile

[CocosPods](http://cocosPods.org) is the recommended methods of installation PathCover, just add the following line to 'Profile':


pod ' SortProperty', '~> 1.3.3'

 1.下载事例程序，把事例程序代码中SortProperty文件夹，拖到自己项目中。
## How to use ##
```objc
zooimg effect property to user, but if you user zooimg effect, will be dissmiss parallax effect.      

#import "SortPropertyHeade.h"    
在自己的项目：
@interface xx ()
 1.在xx.h把tableViewData_h() 写在.h,或者.m（声明数组）
tableViewData_h()
 2.在xx.m把tableViewData_m() 写在.m()（懒加载数组）
 3.在xx.m把tableViewDataSource_m() 写在.m()（为tableView的delegate）
 3.在xx.m把tableViewSectionIndexTitle_m()写在.m()(像通讯录的字母)。
@end

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

static NSString *cellID = @"cellID";
UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];

if (cell == nil) {
cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
}
//模型
id model=self.totalData[indexPath.section][indexPath.row];
return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
   self.pinYinData[section]返回字符串。
   通过section判断，设置自己需要。

```
## Lincense ##

`SortProperty` is available under the MIT license. See the LICENSE file for more info.
