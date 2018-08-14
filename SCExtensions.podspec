#
# Be sure to run `pod lib lint SCExtensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SCExtensions'
  s.version          = '0.1.0'
  s.summary          = 'SCExtensions is a NSObject extensions for Objective C.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'SCExtensions is a NSObject extensions for Objective C. Useful methods to make your life easier'

  s.homepage         = 'https://github.com/schris20/SCExtensions'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Stefanos Christodoulides' => 'schris186@gmail.com' }
  s.source           = { :git => 'https://github.com/schris20/SCExtensions.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SCExtensions/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SCExtensions' => ['SCExtensions/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
