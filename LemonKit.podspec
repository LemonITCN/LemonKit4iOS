Pod::Spec.new do |s|
  s.name             = "LemonKit"
  s.version          = "1.0.11"
  s.summary          = "一个可以让你开发iOS爽到爆的framework!"
  s.description      = <<-DESC
                       移动开发框架的新血液——LemonKit！更有Swift和Android版本哦！
                       DESC
  s.homepage         = "https://github.com/1em0nsOft/LemonKit4iOS"
  # s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "1em0nsOft-Liuri" => "liuri@lemonsoft.net" }
  s.source           = { :git => "https://github.com/1em0nsOft/LemonKit4iOS.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://www.lemonsoft.net'

  s.platform     = :ios, '8.0'
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'LemonKit/LemonKit/**/*'
  # s.resources = 'Assets'

  # s.ios.exclude_files = 'Classes/osx'
  # s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'

end