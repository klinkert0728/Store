platform :ios, '8.0'
use_frameworks!

target 'StoreIOS' do
	pod 'SVProgressHUD'
    pod 'SBPickerSelector'
    pod 'DateTools', :git => 'https://github.com/MatthewYork/DateTools', :branch => 'swift'
	pod 'RealmSwift'
	pod 'Alamofire'
	pod 'AlamofireImage'
	pod 'ObjectMapper'
    pod 'RealReachability'
    pod 'RxSwift'
    pod 'RxCocoa'
    pod 'RxRealm'
    pod 'AlamofireObjectMapper'
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
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
