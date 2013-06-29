Pod::Spec.new do |s|
  s.name         = "ErnKit"
  s.version      = "0.0.5"
  s.summary      = "ErnKit is a framework for simplifying the development of well structured Objective-C apps."
  s.homepage     = "http://github.com/ernstsson/ErnKit"
  s.license      = 'MIT'
  s.author       = {
      "Magnus Ernstsson" => "magnus@ernstsson.net"
  }
  s.source       = {
      :git => "https://github.com/ernstsson/ErnKit.git",
      :tag => "v0.0.5"
  }
  s.platform     = :ios, '5.0'
  s.requires_arc = true
  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
    core.source_files = 'Source/ErnKit/**/*.{h,m}'
    core.frameworks = 'Foundation'
  end
  s.subspec 'UIKitIntegration' do |uikit|
    uikit.source_files = 'Source/ErnKitUIKitIntegration/**/*.{h,m}'
    uikit.dependency 'ErnKit/Core'
    uikit.frameworks = 'Foundation', 'UIKit', 'CoreGraphics'
  end
  s.subspec 'MapKitIntegration' do |mapkit|
    mapkit.source_files = 'Source/ErnKitMapKitIntegration/**/*.{h,m}'
    mapkit.dependency 'ErnKit/Core'
    mapkit.dependency 'ErnKit/UIKitIntegration'
    mapkit.frameworks = 'Foundation', 'UIKit', 'MapKit', 'CoreLocation', 'CoreGraphics'
  end
  s.subspec 'RestKitIntegration' do |restkit|
    restkit.source_files = 'Source/ErnKitRestKitIntegration/**/*.{h,m}'
    restkit.dependency 'ErnKit/Core'
    restkit.dependency 'RestKit'
    restkit.frameworks = 'Foundation'
  end
  s.subspec 'CoreProtocolTest' do |core_test|
    core_test.source_files = 'ProtocolTests/ErnKit/**/*.{h,m}'
    core_test.dependency 'OCMock'
    core_test.dependency 'OCHamcrest'
    core_test.frameworks = 'Foundation'
  end
end
