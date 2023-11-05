//
//  View-Extension.swift
//  Deves
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/06.
//

import Foundation
import SwiftUI

extension View {

    func addGradation(startColor: Color, endColor: Color) -> some View {
        return LinearGradient(colors: [startColor, endColor], startPoint: .top, endPoint: .bottom)
    }
}
