#
# Be sure to run `pod lib lint XNKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XNKit'
  s.version          = '1.3'
  s.summary          = 'IOS开发中常用的工具类集锦'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/LuohanCC/XNKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LuohanCC' => 'luohancc@163.com' }
  s.source           = { :git => 'https://github.com/LuohanCC/XNKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  
  s.dependency 'Masonry'
  s.dependency 'MJRefresh'
  s.dependency 'SDWebImage'
  s.dependency 'AFNetworking'
  s.dependency 'XNProgressHUD'
  
  s.source_files = 'XNKit/Classes/**/*'

  s.subspec 'Header' do |ss|
     ss.source_files = 'XNKit/Classes/Header/*'
  end
  
  s.subspec 'Utils' do |ss|
    ss.source_files = 'XNKit/Classes/Utils/**/*'
  end
  
#  s.subspec 'Extension' do |ss|
#     ss.source_files = 'XNKit/Classes/Extension/*+*'
#  end

  s.subspec 'ViewController' do |ss|
    ss.source_files = 'XNKit/Classes/ViewController/*'
  end
  
  s.subspec 'Views' do |ss|
     ss.source_files = 'XNKit/Classes/Views/*'
  end
  
  s.resource_bundles = {
         'XNKit' => ['XNKit/Assets/**/*']
  }
  
  
  s.swift_version='4.0'
  s.requires_arc = true

  valid_archs = ['arm64', 'armv7', 'armv7s']

  s.frameworks = 'UIKit', 'AVFoundation'
  s.libraries = 'c++','resolv'
  
end
