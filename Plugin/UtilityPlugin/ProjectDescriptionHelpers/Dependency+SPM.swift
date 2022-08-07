
import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let ComposableArchitecture = TargetDependency.package(product: "ComposableArchitecture")
}

public extension Package {
    static let ComposableArchitecture = Package.remote(
        url: "https://github.com/pointfreeco/swift-composable-architecture",
        requirement: .upToNextMajor(from: "0.38.3")
    )
}
