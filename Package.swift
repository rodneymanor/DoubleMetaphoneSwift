// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DoubleMetaphoneSwift",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DoubleMetaphoneSwift",
            targets: ["DoubleMetaphoneSwift"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Target for the underlying C/Objective-C implementation
        .target(
            name: "CDoubleMetaphone",
            dependencies: [],
            path: "DoubleMetaphoneSwift/double_metaphone",
            publicHeadersPath: "." // Expose headers in the target's root
        ),
        // Main Swift target that wraps the C implementation
        .target(
            name: "DoubleMetaphoneSwift",
            dependencies: ["CDoubleMetaphone"], // Depends on the C target
            path: "DoubleMetaphoneSwift",
            exclude: ["double_metaphone", "Info.plist"] // Exclude the C source folder and Info.plist
        ),
        .testTarget(
            name: "DoubleMetaphoneSwiftTests",
            dependencies: ["DoubleMetaphoneSwift"],
            path: "DoubleMetaphoneSwiftTests",
            exclude: ["Info.plist"] // Exclude Info.plist from test target
        ),
    ]
)
