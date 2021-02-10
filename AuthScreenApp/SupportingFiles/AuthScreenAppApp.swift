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
    
    // require to configure the app for firebase
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
