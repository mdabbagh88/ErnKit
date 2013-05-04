Pod::Spec.new do |s|
  s.name = 'ErnKitMapKitIntegration'
  s.version = '0.0.1'
  s.platform = :ios
  s.ios.deployment_target = '4.3'
  s.source_files = '**/*.{h,m}'
  s.requires_arc = true
  s.ios.dependency 'ErnKit'
end
