import SwiftUI
import RootFeature
import ComposableArchitecture

@main
struct DaangnApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(
                store: Store(
                    initialState: RootState(),
                    reducer: rootReducer,
                    environment: .live
                )
            )
        }
    }
}
