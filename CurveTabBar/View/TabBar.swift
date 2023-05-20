//
//  TabBar.swift
//  CurveTabBar
//
//  Created by Hemant kumar on 16/05/23.
//

import SwiftUI

struct TabBar: View {
    
    //MARK: - Properties
    @State private var activeTab: Tab = .appointMent
    @State private var tabShapPosition: CGPoint = .zero
    
    init() {
        //Hiding Tabbar due to SwiftUI iOS 16 Bug
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $activeTab) {
                Text("Home")
                    .tag(Tab.home)
                Text("Service")
                    .tag(Tab.services)
                Text("AppointMent")
                    .tag(Tab.appointMent)
                Text("Notification")
                    .tag(Tab.notification)
                Text("Profile")
                    .tag(Tab.profile)
            }
            customTabBar()
        }
    }
    
    //Custom Tab Bar
    @ViewBuilder
    func customTabBar(_ tint: Color = Color("Black"), _ inactiveTint: Color = .gray) -> some View {
        //Moving all the remaining tab items to bottom
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) {
                TabItem(tint: tint,
                        inactiveTint: inactiveTint,
                        tab: $0,
                        activeTab: $activeTab,
                        position: $tabShapPosition
                )
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(content: {
            TabShape(midPoint: tabShapPosition.x)
                .fill(.white)
                .ignoresSafeArea()
            //Adding shadow
            //for shape smothing
                .shadow(color: tint.opacity(0.2), radius: 5, x: 0, y: -5)
                .padding(.top, 25)
        })
        //Adding Animation when switch one tab to second tab
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
