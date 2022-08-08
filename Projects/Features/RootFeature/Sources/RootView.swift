import SwiftUI
import ComposableArchitecture

public struct RootView: View {
    let store: Store<RootState, RootAction>

    public var body: some View {
        WithViewStore(store) { viewStore in
            Text("ASD")
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(store: Store(
            initialState: RootState(),
            reducer: rootReducer,
            environment: RootEnvironment()
        ))
    }
}
