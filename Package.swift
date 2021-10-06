// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Turbo",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "Turbo",
            targets: ["Turbo"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick.git", from: "4.0.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "9.0.0"),
        .package(url: "https://github.com/AliSoftware/OHHTTPStubs.git", from: "9.0.0"),
        .package(url: "https://github.com/nostradani/GCDWebServer.git", .branch("master")), //basecamp/GCDWebServer looks like a broken WIP
    ],
    targets: [
        .target(
            name: "Turbo",
            dependencies: [],
            path: "Source",
            exclude: [],
            resources: [
                .copy("WebView/turbo.js")
            ]),
        .testTarget(
            name: "Tests",
            dependencies: [
                "Turbo",
                "Quick",
                "Nimble",
                .product(name: "OHHTTPStubsSwift", package: "OHHTTPStubs"),
                .product(name: "GCDWebServers", package: "GCDWebServer")],
            path: "Tests",
            exclude: [],
            resources: [
                .copy("Fixtures/test-configuration.json"),
                .copy("Server")
            ])
    ]
)
