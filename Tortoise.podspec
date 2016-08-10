Pod::Spec.new do |s|
  s.name = "Tortoise"
  s.version = "0.0.1"
  s.summary = "Tortoise"
  s.description = ""
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.frameworks = "Foundation", "UIKit", "CoreGraphics"
  s.source = { :git => "https://github.com/temoki/Tortoise" }
  s.source_files = "Tortoise/*"
  s.requires_arc = true
end
