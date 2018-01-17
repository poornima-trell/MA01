Pod::Spec.new do |s|
s.platform = :ios
s.name             = 'MA01'
s.version          = '0.1.0'
s.summary          = 'By far the most fantastic view I have seen in my entire life. No joke.'

s.description      = <<-DESC
This fantastic view changes its color gradually makes your app look fantastic!
DESC

s.homepage         = 'https://github.com/Poornima-Trell/MA01'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Poornima-Trell' => 'poornima@trellisys.net' }
s.source           = { :git => 'https://github.com/Poornima-Trell/MA01.git', :tag => s.version.to_s }
s.framework = 'UIKit','Foundation'
s.ios.deployment_target = '10.0'
s.source_files = 'MA01/**/*'
s.resource_bundles = {
'MA01' => ['images/*.png']
}
end
