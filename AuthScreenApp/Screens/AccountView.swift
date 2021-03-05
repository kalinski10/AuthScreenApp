//
//  AccountView.swift
//  AuthScreenApp
//
//  Created by Kalin Balabanov on 19/02/2021.
//

import SwiftUI

struct AccountView: View {
    
    @EnvironmentObject var userSession: UserSession
    
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                Button {
                    withAnimation {
                        isShowing.toggle()
                    }
                } label: {
                    Text(userSession.user?.name ?? "you failed friend")
                }
            }
        }
        .cornerRadius(20)
        .shadow(radius: 15)
        .onAppear {
            userSession.retrieveUserDetails()
            print(userSession.user ?? "no user was found")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(isShowing: .constant(true))
    }
}
