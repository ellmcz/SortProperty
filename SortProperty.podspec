Pod::Spec.new do |s|
  s.name         = "SortProperty"
  s.version      = "1.1"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.summary      = "排序框架"
  s.homepage     = "https://github.com/ellmcz/SortProperty"
  s.authors      = { "ellmcz" => "wqbs007@163.com" }
  s.source       = { :git => "https://github.com/ellmcz/SortProperty.git", :tag =>   "1.1" }
  s.platform     = :ios, '6.0'
  s.requires_arc = true
  s.source_files = 'SortProperty/*.{h,m}'
  
end