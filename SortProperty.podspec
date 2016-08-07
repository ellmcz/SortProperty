Pod::Spec.new do |s|
  s.name         = "SortProperty"
  s.version      = "1.5.5"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.summary      = "排序框架,可以实现通讯录，微信通讯录,个人朋友的空间信息，个人微信页面，城市"
  s.homepage     = "https://github.com/ellmcz/SortProperty"
  s.authors      = { "ellmcz" => "wqbs007@163.com" }
  s.source       = { :git => "https://github.com/ellmcz/SortProperty.git", :tag =>   "1.5.5" }
  s.platform     = :ios, '6.0'
  s.requires_arc = true
  s.source_files = 'SortProperty/*.{h,m}'
end