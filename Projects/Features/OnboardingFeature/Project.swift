
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "OnboardingFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.CommonFeature
    ]
)
