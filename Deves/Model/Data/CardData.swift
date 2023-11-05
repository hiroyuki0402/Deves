//
//  CardData.swift
//  Deves
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/06.
//

import Foundation
import SwiftUI

struct CardData: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
