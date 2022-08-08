
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "OnboardingFeature",
    productt: .staticFramework,
    dependencies: [
        .Project.Features.CommonFeature
    ]
)