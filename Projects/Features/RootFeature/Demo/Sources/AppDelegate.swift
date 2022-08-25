import UIKit
import Inject
import SwiftUI
import OnboardingFeature

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = Inject.ViewControllerHost(
            UIHostingController(
                rootView: OnboardingView(
                    store: .init(
                        initialState: .init(),
                        reducer: onboardingReducer,
                        environment: .live
                    )
                )
            )
        )
        viewController.view.backgroundColor = .yellow
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()

        return true
    }
}
