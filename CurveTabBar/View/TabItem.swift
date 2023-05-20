//
//  TabItem.swift
//  CurveTabBar
//
//  Created by Hemant kumar on 20/05/23.
//

import SwiftUI

struct TabItem: View {
    var tint: Color
    var inactiveTint: Color
    var tab: Tab
    @Binding var activeTab: Tab
    @Binding var position: CGPoint
    
    //Each tab item position on screen
    @State private var tabPosition: CGPoint = .zero
    
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: tab.systenImage)
                .font(.title2)
                .foregroundColor(setColor())
            //Provide Size for Center Active tab
                .frame(width: tab == .appointMent ? 58 : 35, height: tab == .appointMent ? 58 : 35)
                .background {
                    if tab == .appointMent {
                        Circle()
                            .fill(tint.gradient)
                    }
                }
            Text(tab.rawValue)
                .font(.caption)
                .foregroundColor(activeTab == tab ? tint : inactiveTint)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .viewPosition(completion: { rect in
            tabPosition.x = rect.midX
            
            //Updating Active Tab Position
            if tab == .appointMent {
                position.x = rect.midX
            }
        })
        .onTapGesture {
            activeTab = tab
        }
    }
    
    func setColor() -> Color {
        if activeTab == .appointMent && tab == .appointMent {
            return .white
        } else {
            return activeTab == tab ? tint : inactiveTint
        }
    }
}
