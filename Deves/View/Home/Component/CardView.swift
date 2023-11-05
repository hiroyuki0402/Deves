//
//  CardView.swift
//  Deves
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/06.
//

import SwiftUI

struct CardView: View {
    // MARK: - プロパティー

    private let colors: (startColor: Color, endColor: Color) = (startColor: .color01, endColor: .color02)

    var cardData: CardData

    @State var isAnimating: Bool = false

    @State var isMoveDown: Bool = false

    @State var isMoveUp: Bool = false

    @State var isShowAlert: Bool = false

    // MARK: - ボディー

    var body: some View {
        ZStack {
            Image(cardData.imageName)
                .opacity(isAnimating ? 1: 0)

            VStack {
                Text(cardData.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)

                Text(cardData.headline)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .italic()

            }
            .offset(y: isMoveDown ? -220: -300)

            Button {
                Sound.shared.playSound(sound: .soundchime, type: .mp3)
                isShowAlert.toggle()
            } label: {
                HStack {
                    Text(cardData.callToAction)
                        .fontWeight(.heavy)
                    .foregroundColor(.white)

                    Image(systemName: "arrow.right.circle")
                        .font(.system(.title).weight(.medium))
                        .accentColor(.white)

                }
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(addGradation(startColor: colors.startColor, endColor: colors.endColor))
                .clipShape(Capsule())
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
            //addGradation(startColor: colors.startColor, endColor: colors.endColor)
            .offset(y: isMoveUp ? 180: 300)
        }
        .frame(height: 545)
        .background(LinearGradient(colors: cardData.gradientColors, startPoint: .top, endPoint: .bottom))
        .frame(maxWidth: .infinity)
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear {
            withAnimation(.linear(duration: 1.2)) {
                isAnimating.toggle()
            }
            withAnimation(.linear(duration: 0.8)) {
                isMoveDown.toggle()
                isMoveUp.toggle()
            }
        }
        .alert(isPresented: $isShowAlert, content: {
            Alert(
                title: Text(cardData.title),
                message: Text(cardData.message),
                dismissButton: .default(Text("OK")))
        })
    }//: ボディー
}

#Preview {
    CardView(cardData: CardViewModel().getItem(at: 0))
        .padding(.horizontal, 40)
}
