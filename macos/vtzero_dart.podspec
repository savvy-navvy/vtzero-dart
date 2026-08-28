#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint vtzero_dart.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'vtzero_dart'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter FFI plugin project.'
  s.description      = <<-DESC
A new Flutter FFI plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }

  # Sources live under the SPM layout so CocoaPods and SwiftPM compile the
  # same forwarder. The .mm file relatively includes `../src/*` so C++ can be
  # shared across Android/iOS/macOS/desktop.
  s.source           = { :path => '.' }
  s.source_files = 'vtzero_dart/Sources/vtzero_dart/**/*.{h,m,mm,cpp,cc,c}'
  s.public_header_files = 'vtzero_dart/Sources/vtzero_dart/include/**/*.h'
  s.dependency 'FlutterMacOS'
  s.platform = :osx, '10.15'

  # Add C++ standard and include paths for vtzero
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++14',
    'CLANG_CXX_LIBRARY' => 'libc++',
    'HEADER_SEARCH_PATHS' => '$(inherited) "${PODS_TARGET_SRCROOT}/../third_party/vtzero/include" "${PODS_TARGET_SRCROOT}/../third_party/protozero/include" "${PODS_TARGET_SRCROOT}/../src"',
    'WARNING_CFLAGS' => '$(inherited) -Wno-documentation -Wno-documentation-deprecated-sync'
  }
  s.swift_version = '5.0'
end
