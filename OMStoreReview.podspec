Pod::Spec.new do |s|
  s.name             = 'OMStoreReview'
  s.version          = '0.1.1'
  s.swift_version    = '4.0'
  s.summary          = 'OMStoreReview is for control when you show the SKStoreReview'
  s.description      = <<-DESC
Add a minimun touch for show the StoreReview modal and after the modal show, that modal didn't show again.
                       DESC

  s.homepage         = 'https://github.com/orbismobile/OMStoreReview'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Orbis Mobile' => 'ios.orbismobile@gmail.com' }
  s.source           = { :git => 'https://github.com/orbismobile/OMStoreReview.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'Classes/**/*'
  
  s.frameworks = 'StoreKit'
end
