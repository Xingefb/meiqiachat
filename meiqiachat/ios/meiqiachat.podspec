#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'meiqiachat'
  s.version          = '1.0.1'
  s.summary          = 'meiqia sdk init and to chat'
  s.description      = <<-DESC
A new flutter plugin project. to use meiqian chat
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'loself' => 'loselfmin@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'Meiqia', '~> 3.4.9'
  s.static_framework = true
  s.ios.deployment_target = '8.0'
end

