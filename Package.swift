// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PopupView",
    products: [
        .library(name: "PopupView", targets: ["PopupView"])
    ],
    dependencies: [],
    targets: [
        .target(name: "PopupView", dependencies: [])
    ]
)
