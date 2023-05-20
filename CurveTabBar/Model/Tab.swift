//
//  Tab.swift
//  CurveTabBar
//
//  Created by Hemant kumar on 16/05/23.
//

import Foundation

enum Tab: String, CaseIterable {
    case home = "Home"
    case services = "Services"
    case appointMent = "Book"
    case notification = "Notification"
    case profile = "Profile"
    
    var systenImage: String {
        switch self {
        case .home:
            return "house"
        case .services:
            return "envelope.open.badge.clock"
        case .appointMent:
            return "scissors"
        case .notification:
            return "bell"
        case .profile:
            return "person"
        }
    }
    
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}
