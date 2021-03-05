//
//  MainView.swift
//  AuthScreenApp
//
//  Created by Kalin Balabanov on 18/02/2021.
//

import SwiftUI

struct MainView: View {
    
    @State private var isShowingMenu = false
    
    var body: some View {
        ZStack {
            if isShowingMenu {
                SideMenu(isShowing: $isShowingMenu)
            }
            
            AccountView(isShowing: $isShowingMenu)
                .offset(x: isShowingMenu ? 250 : 0 , y: isShowingMenu ? 100 : 0)
                .scaleEffect(isShowingMenu ? 0.6 : 1)
        }
        .ignoresSafeArea()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
