//
//  CardViewModel.swift
//  Deves
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/06.
//

import Foundation

class CardViewModel: ObservableObject {

    @Published var cardDatas: [CardData] = []

    init() {
        loadData()
    }

    func loadData() {
        self.cardDatas = TestData.shared.cardViewTestData()
    }

    func getItem(at index: Int) -> CardData {
        return cardDatas[index]
    }
}
