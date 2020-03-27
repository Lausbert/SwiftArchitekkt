Pod::Spec.new do |s|
    s.name             = 'SwiftArchitekkt'
    s.version          = '0.1.31'
    s.summary          = 'An implementation of a graph request handler, which handles XCode projects & workspaces.'

    s.description      = <<-DESC
An implementation of a graph request handler, which handles XCode projects & workspaces.
    DESC

    s.homepage         = 'https://github.com/Lausbert/SwiftArchitekkt'
    s.author           = { 'Lausbert' => 'stephanlerner@icloud.com' }
    s.source           = { :git => 'https://github.com/Lausbert/SwiftArchitekkt.git', :tag => s.version.to_s }

    s.platform = :osx
    s.osx.deployment_target = "10.14"
    s.swift_version = '5.0'

    s.source_files = 'SwiftArchitekkt/Source/**/*'

    s.dependency 'CoreArchitekkt'
end
