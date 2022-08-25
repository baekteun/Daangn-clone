import SwiftUI
import ComposableArchitecture
import DesignSystem

public struct OnboardingView: View {
    let store: Store<OnboardingState, OnboardingAction>

    public init(store: Store<OnboardingState, OnboardingAction>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Spacer()
                DesignSystemAsset.carrot.suiImage
                    .resizable()
                    .frame(maxWidth: 120, maxHeight: 120)
                Text("당신 근처의 당근마켓")
                    .font(.title2.bold())
                Text("중고 거래부터 동네 정보까지.\n지금 내 동네를 선택하고 시작해보세요!")
                    .multilineTextAlignment(.center)
                    .padding(.top, 5)
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "globe")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(.gray)
                        Text("한국")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                    }
                }
                .padding(.top, 10)
                Spacer()
                Button {
                    
                } label: {
                    Text("시작하기")
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(.orange)
                        )
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 16)

            }
        }
    }
}

//struct OnboardingView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingView(
//            store: Store(
//                initialState: OnboardingState(),
//                reducer: onboardingReducer,
//                environment: .live
//            )
//        )
//    }
//}
