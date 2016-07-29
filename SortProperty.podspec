Pod::Spec.new do |s|
  s.name         = "SortProperty"
  s.version      = "1.0.0"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.summary      = "排序框架"
  s.homepage     = "https://github.com/ellmcz/SortProperty"
  s.authors      = { "ellmcz" => "wqbs007@163.com" }
  s.source       = { :git => "https://github.com/ellmcz/SortProperty.git", :tag => "1.0.0" }
  s.platform     = :ios, '4.3'
  s.requires_arc = true
  s.source_files = 'SortProperty/*.{h,m}'
end