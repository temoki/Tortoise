Pod::Spec.new do |s|
  s.name = "Tortoise"
  s.version = "0.0.1"
  s.summary = "Turtle graphics engine for iOS."
  s.description = "Tortoise Description"
  s.homepage = 'https://github.com/temoki/Tortoise'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.authors = 'temoki'
  s.frameworks = "Foundation", CoreGraphics"
  s.source = { :git => "https://github.com/temoki/Tortoise" }
  s.source_files = "Tortoise/*"
  s.requires_arc = true
end
