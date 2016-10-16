Pod::Spec.new do |s|
  s.name             = 'BrowserQuestKit'
  s.version          = '0.1.0'
  s.summary          = 'BrowserQuest assets with SpriteKit.'
  s.description      = <<-DESC
The helper library to use sprites, maps, sounds and musics of BrowserQuest for SpriteKit.
                       DESC
  s.homepage         = 'https://github.com/tnantoka/BrowserQuestKit'
  s.license          = { :type => 'CC-BY-SA 3.0', :file => 'LICENSE' }
  s.author           = { 'tnantoka' => 'tnantoka@bornneet.com' }
  s.source           = { :git => 'https://github.com/tnantoka/BrowserQuestKit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/tnantoka'

  s.ios.deployment_target = '10.0'

  s.source_files = 'BrowserQuestKit/Classes/**/*'
  
  s.resource_bundles = {
    'BrowserQuestKit' => ['BrowserQuestKit/Assets/**/*']
  }
end
