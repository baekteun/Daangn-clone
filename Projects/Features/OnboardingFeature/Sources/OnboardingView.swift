import SwiftUI
import ComposableArchitecture

public struct OnboardingView: View {
    let store: Store<OnboardingState, OnboardingAction>
    
    public init(store: Store<OnboardingState, OnboardingAction>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            Text("Asdf")
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(
            store: Store(
                initialState: OnboardingState(),
                reducer: onboardingReducer,
                environment: .live
            )
        )
    }
}
