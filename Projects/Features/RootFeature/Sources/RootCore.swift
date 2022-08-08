import ComposableArchitecture
import Foundation

public struct RootState: Equatable {

}

public enum RootAction: Equatable {

}

public struct RootEnvironment {

}

public extension RootEnvironment {
    static let live = RootEnvironment()
}

let rootReducer = Reducer<
    RootState,
    RootAction,
    RootEnvironment
> { state, action, env in
    return .none
}
