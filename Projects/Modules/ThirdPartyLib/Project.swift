import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "ThirdPartyLib",
    product: .framework,
    packages: [
        .ComposableArchitecture
    ],
    dependencies: [
        .SPM.ComposableArchitecture
    ]
)
