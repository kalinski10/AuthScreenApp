//
//  SideMenu.swift
//  AuthScreenApp
//
//  Created by Kalin Balabanov on 18/02/2021.
//

import SwiftUI

struct SideMenu: View {
    
    @Binding var isShowing: Bool
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                BrandGradient()
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        HeaderView()
                        
                        ForEach(Option.options) { option in
                            NavigationLink(destination: LoginView()) {
                                MenuCell(imageName: option.imageName, title: option.title)
                            }
                        }
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                    Button {
                        isShowing = false
                    } label: {
                        XMarkButton()
                    }
                    

                }
                .padding()
                .padding(.top, 50)

            }
            .ignoresSafeArea()
            .foregroundColor(.white)
        }
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu(isShowing: .constant(true))
    }
}


struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("profile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            Text("Kalin Balabanov")
                .font(.title)
                .bold()
                .padding(.top)
            
            Text("Some random description for bio perhaps")
                .padding(.bottom)
        }
    }
}
