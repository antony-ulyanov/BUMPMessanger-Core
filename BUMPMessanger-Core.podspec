#
# Be sure to run `pod lib lint BUMPMessanger-Core.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "BUMPMessanger-Core"
  s.version          = "0.1.0"
  s.summary          = "Core functionls and utils for BUMP"
  s.description      = <<-DESC
                       Includes:

                        * Application settings
                        * Date utils
                        * Json utils
                        * String utils
                        * Device utils
                        * Mobile registration and authentication presenters
                        * Crittercism service
                        * Google analitics service
                       DESC
  s.homepage         = "https://github.com/antony-ulyanov/BUMPMessanger-Core"
  s.license          = 'MIT'
  s.author           = { "Anton Ulyanov" => "rumburu@gmail.com" }
  s.source           = { :git => "https://github.com/antony-ulyanov/BUMPMessanger-Core.git", :tag => s.version.to_s }

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*.{m,h}'
  s.resource_bundles = {
    'BUMPMessanger-Core' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'AFNetworking', '~> 2.5.4'
  s.dependency 'CocoaLumberjack'
  s.dependency 'CrittercismSDK', '~> 5.5.1'
  s.dependency 'Objection', '1.4'
end
