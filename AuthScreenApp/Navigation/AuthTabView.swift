//
//  AuthTabView.swift
//  AuthScreenApp
//
//  Created by Kalin Balabanov on 24/02/2021.
//

import SwiftUI

struct AuthTabView: View {
    
    @EnvironmentObject var userSession: UserSession
    
    
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            MainView()
                .tabItem {
                    Image(systemName: "house")
                    Text("second Home")
                }
        }
        .onAppear {
            userSession.retrieveUserDetails()
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        AuthTabView()
    }
}
