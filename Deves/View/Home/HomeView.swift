//
//  HomeView.swift
//  Deves
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/05.
//

import SwiftUI

struct HomeView: View {
    // MARK: - プロパティー
    @StateObject var cardViewModel = CardViewModel()
    // MARK: - ボディー

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(cardViewModel.cardDatas) { item in
                    CardView(cardData: item)
                }
            }
            .padding(20)
        }
    }//: ボディー
}

#Preview {
    HomeView()
}
