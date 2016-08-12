Pod::Spec.new do |s|
  s.name = 'Tortoise'
  s.version = '0.0.1'
  s.cocoapods_version = '>= 1.0.0'
  s.authors = 'temoki'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage = 'https://github.com/temoki/Tortoise'
  s.source = { :git => 'https://github.com/temoki/Tortoise' }
  s.summary = 'Turtle graphics engine for iOS.'
  s.description = 'Tortoise is a turtle graphics engine for iOS. This project supports only Swift 3 and Xcode 8.'
  s.platform = :ios
  s.ios.deployment_target = '10.0'
  s.requires_arc = true
  s.frameworks = 'Foundation', 'CoreGraphics'
  s.source_files = 'Tortoise/*', 'Tortoise/Private/*'
end
