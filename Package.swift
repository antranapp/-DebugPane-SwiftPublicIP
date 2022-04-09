// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "DebugPane_SwiftPublicIP",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "DebugPane_SwiftPublicIP",
            targets: ["DebugPane_SwiftPublicIP"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/antranapp/DebugPane", .branch("master")),
        .package(
            name: "SwiftPublicIP",
            url: "https://github.com/HackingGate/Swift-Public-IP",
            .branch("master")
        ),
    ],
    targets: [
        .target(
            name: "DebugPane_SwiftPublicIP",
            dependencies: [
                "SwiftPublicIP",
                "DebugPane",
            ]
        ),
        .testTarget(
            name: "DebugPane_SwiftPublicIPTests",
            dependencies: ["DebugPane_SwiftPublicIP"]
        ),
    ]
)
