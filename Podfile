platform :ios, '8.0'
use_frameworks!
inhibit_all_warnings!

target 'StoreIOS' do
	pod 'SVProgressHUD'
    pod 'SBPickerSelector'
    pod 'DateToolsSwift', :git => 'https://github.com/MatthewYork/DateTools', :branch => 'swift'
	pod 'RealmSwift'
	pod 'Alamofire'
	pod 'AlamofireImage'
	pod 'ObjectMapper'
    pod 'RealReachability'
    pod 'AlamofireObjectMapper', :git => 'https://github.com/tristanhimmelman/AlamofireObjectMapper', :branch => 'swift-4'
    pod 'FBSDKLoginKit'
    pod 'ReachabilitySwift', '~> 3'
    pod 'HCSStarRatingView', '~> 1.5'
    pod 'Polyline', '~> 4.0'
    pod 'Fabric'
    pod 'Crashlytics'
    pod 'GooglePlacePicker'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.2'
        end
    end
end
