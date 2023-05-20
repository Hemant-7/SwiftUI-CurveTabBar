//
//  TabPosition.swift
//  CurveTabBar
//
//  Created by Hemant kumar on 20/05/23.
//

import SwiftUI

//Custom View Extention
//Which will return the position
struct PosistionKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

extension View {
    @ViewBuilder
    func viewPosition(completion: @escaping (CGRect) -> ()) -> some View {
        self
            .overlay {
                GeometryReader {
                    let rect = $0.frame(in: .global)
                    Color.clear
                        .preference(key: PosistionKey.self, value: rect)
                        .onPreferenceChange(PosistionKey.self, perform: completion)
                }
            }
    }
}
