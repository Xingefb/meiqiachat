#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'meiqiachat'
  s.version          = '1.1.1'
  s.summary          = 'meiqia sdk init and to chat'
  s.description      = <<-DESC
  首次创建plugin并上传，针对flutter技术还在探索学习中，本次集成的是美洽3.5.0，如果时间允许会进一步跟进sdk的其他功能集成，本次集成只实现了项目的初始化和跳转客服聊天页面。如果有同样需求的朋友可以自行去官网查看https://www.meiqia.com后续的sdk功能。
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'loself' => 'loselfmin@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'Meiqia', '~> 3.5.0'

  s.ios.deployment_target = '10.0'
end

