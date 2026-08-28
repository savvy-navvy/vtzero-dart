// swift-tools-version: 5.9
// SPM packaging for the Flutter FFI plugin. Compiles the same C++ forwarder
// CocoaPods used; Dart/FFI behavior is unchanged.
import PackageDescription

let package = Package(
    name: "vtzero_dart",
    platforms: [
        .macOS("10.15"),
    ],
    products: [
        // Flutter rewrites "_" -> "-" in product names for SPM.
        // type: .dynamic so dart:ffi can DynamicLibrary.open the framework.
        .library(name: "vtzero-dart", type: .dynamic, targets: ["vtzero_dart"]),
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
    ],
    targets: [
        .target(
            name: "vtzero_dart",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
            ],
            cSettings: [
                .headerSearchPath("include/vtzero_dart"),
            ],
            cxxSettings: [
                // SPM rejects -I paths outside the package root, so headers are
                // vendored under macos/vtzero_dart/ThirdParty/ (same libs as
                // third_party/ used by the CocoaPods podspec).
                // Paths are relative to Sources/vtzero_dart/
                .headerSearchPath("../../ThirdParty/vtzero_include"),
                .headerSearchPath("../../ThirdParty/protozero_include"),
                .headerSearchPath("../../ThirdParty/src"),
            ],
            linkerSettings: [
                .linkedLibrary("c++"),
            ]
        ),
    ],
    cxxLanguageStandard: .cxx14
)
