Pod::Spec.new do |s|
    s.name     = 'PDSSetting_objc'
    s.version  = '0.0.1'
    s.summary  = 'Description'
    s.license  = {
        :type => 'MIT',
        :file => 'LICENSE'
    }
    s.author   = {
        'w91379137' => 'w91379137'
    }
    s.homepage = 'https://github.com/w91379137/PDSSetting_objc'

    s.source   = {
        :git => 'https://github.com/w91379137/PDSSetting_objc.git',
        :tag => s.version.to_s
    }
    s.source_files = 'PDSSetting_objc/*{.h,.c,.m}'
    s.requires_arc = true

    s.platform = :ios
    s.ios.deployment_target = '8.0'
end
