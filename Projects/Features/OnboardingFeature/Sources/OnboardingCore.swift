import ComposableArchitecture
import Foundation

public struct OnboardingState: Equatable {
    
    public init() {
        
    }
}

public enum OnboardingAction: Equatable {
    
}

public struct OnboardingEnvironment {
    
}

public extension OnboardingEnvironment {
    static let live = OnboardingEnvironment()
}

public let onboardingReducer = Reducer<
    OnboardingState,
    OnboardingAction,
    OnboardingEnvironment
> { state, action, env in
    return .none
}
