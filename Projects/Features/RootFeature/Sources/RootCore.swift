import ComposableArchitecture
import Foundation
import OnboardingFeature

public enum RootState: Equatable {
    case onboarding(OnboardingState)
    
    public init() {
        self = .onboarding(.init())
    }
}

public enum RootAction: Equatable {
    case onboardingAction(OnboardingAction)
}

public struct RootEnvironment {

}

public extension RootEnvironment {
    static let live = RootEnvironment()
}

public let rootReducer = Reducer<
    RootState,
    RootAction,
    RootEnvironment
>.combine(
    onboardingReducer.pullback(
        state: /RootState.onboarding,
        action: /RootAction.onboardingAction,
        environment: { _ in OnboardingEnvironment.live }
    ),
    Reducer { state, action, _ in
        
        return .none
    }
)
