Install TensorFlow Lite in Xcode
Open Terminal and navigate to your Xcode project folder:
cd /path/to/your/project
Initialize CocoaPods (if not already done):
pod init
open pod file and add tensorflow lite
target 'YourApp' do
  use_frameworks!
  pod 'TensorFlowLiteSwift'
end
install dependencies
pod install
Now, open the .xcworkspace file
Move waste_classifier.tflite to your Xcode project’s Resources folder.
In Xcode, go to Build Phases > Copy Bundle Resources and add waste_classifier.tflite.
