// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftFacil",
    products: [
        .library(
            name: "SwiftFacil",
            targets: ["SwiftFacil"]),
        .executable(name: "SwiftFacilExampleServer",
            targets: ["SwiftFacilExampleServer"]),
    ],
    targets: [
        .target(
            name: "CFacil",
            sources: [
                "fio.c",
                "tls/fio_tls_missing.c",
                "tls/fio_tls_openssl.c",
                "fiobj/fio_siphash.c",
                "fiobj/fiobj_ary.c",
                "fiobj/fiobj_data.c",
                "fiobj/fiobj_hash.c",
                "fiobj/fiobj_json.c",
                "fiobj/fiobj_mustache.c",
                "fiobj/fiobj_numbers.c",
                "fiobj/fiobj_str.c",
                "fiobj/fiobject.c",
                "cli/fio_cli.c",
                "http/http.c",
                "http/http1.c",
                "http/http_internal.c",
                "http/websockets.c",
                "redis/redis_engine.c"
            ],
            linkerSettings: [
                .linkedLibrary("pthread"),
                .linkedLibrary("m")
            ]
        ),
        .target(
            name: "SwiftFacil",
            dependencies: ["CFacil"]),
        .executableTarget(
            name: "SwiftFacilExampleServer",
            dependencies: ["SwiftFacil"]),
        .testTarget(
            name: "SwiftFacilTests",
            dependencies: ["SwiftFacil"]),
    ]
)
