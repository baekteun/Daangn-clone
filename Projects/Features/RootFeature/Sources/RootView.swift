import SwiftUI
import ComposableArchitecture
import OnboardingFeature

public struct RootView: View {
    let store: Store<RootState, RootAction>

    public var body: some View {
        SwitchStore(store) {
            CaseLet(state: /RootState.onboarding, action: RootAction.onboardingAction) { store in
                OnboardingView(store: store)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(
            store: Store(
                initialState: RootState(),
                reducer: rootReducer,
                environment: RootEnvironment()
            )
        )
    }
}
