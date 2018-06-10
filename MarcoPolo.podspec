Pod::Spec.new do |s|
    s.name             = 'MarcoPolo'
    s.version          = '0.0.1'
    s.summary          = 'A new way of navigating around the iOS'
    s.swift_version    = '4.1'

    s.description      = <<-DESC
    A complete rewrite of UINavigationController in Swift. New `NavigationViewController` is using a simple system of child view controllers to manage the navigation stack.
        DESC

    s.homepage         = 'https://github.com/LiveUI/MarcoPolo'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'rafiki270' => 'dev@liveui.io' }
    s.source           = { :git => 'https://github.com/LiveUI/MarcoPolo.git', :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/rafiki270'

    s.ios.deployment_target = '10.0'

    s.source_files = 'Classes/**/*'
end
