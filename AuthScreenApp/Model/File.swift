//
//  File.swift
//  AuthScreenApp
//
//  Created by Kalin Balabanov on 05/03/2021.
//

import SwiftUI


enum SideMenuViewModel: Int, CaseIterable, Codable {
    
    case profile
    case home
    
    var destNav: some View {
        switch self {
        case .profile:
            return MainView()
            
        case .home:
           return MainView()
        }
    }
}

