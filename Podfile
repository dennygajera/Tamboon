# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Tamboon' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  # Pods for Tamboon

    pod 'RxAlamofire'
    pod 'RxSwift',    '~> 4.0', :inhibit_warnings => true
    pod 'RxCocoa',    '~> 4.0', :inhibit_warnings => true
    pod 'IQKeyboardManagerSwift', :inhibit_warnings => true
    pod 'ReachabilitySwift', :inhibit_warnings => true
    pod 'MBProgressHUD', '~> 1.1.0', :inhibit_warnings => true
    pod 'SDWebImage', :inhibit_warnings => true
    pod 'MFCard', :inhibit_warnings => true

    post_install do |pi|
        pi.pods_project.targets.each do |t|
          t.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
          end
        end
    end

  target 'TamboonTests' do
    inherit! :search_paths
    # Pods for testing
    inherit! :search_paths
          pod 'MFCard'
  end

  target 'TamboonUITests' do
    # Pods for testing
  end

end
