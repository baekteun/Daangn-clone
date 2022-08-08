
import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let ComposableArchitecture = TargetDependency.package(product: "ComposableArchitecture")
    static let Inject = TargetDependency.package(product: "Inject")
}

public extension Package {
    static let ComposableArchitecture = Package.remote(
        url: "https://github.com/pointfreeco/swift-composable-architecture",
        requirement: .upToNextMajor(from: "0.38.3")
    )
    static let Inject = Package.remote(
        url: "https://github.com/krzysztofzablocki/Inject",
        requirement: .upToNextMajor(from: "1.2.1")
    )
}
