//
//  AuthScreenAppApp.swift
//  AuthScreenApp
//
//  Created by Kalin Balabanov on 09/02/2021.
//

import SwiftUI
import Firebase

@main
struct AuthScreenAppApp: App {
    
    @AppStorage("user") private var user: Data?
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if let _ = user {
                    AuthTabView().environmentObject(UserSession())
                    .accentColor(Color(.systemPurple))
                } else {
                    LoginView().environmentObject(UserSession())
                }
            }
        }
    }
}
