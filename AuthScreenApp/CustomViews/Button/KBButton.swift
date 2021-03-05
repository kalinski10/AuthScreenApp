//
//  KBButton.swift
//  AuthScreenApp
//
//  Created by Kalin Balabanov on 18/02/2021.
//

import SwiftUI

struct KBButton: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .bold()
            .foregroundColor(.white)
            .frame(width: 258, height: 50)
            .background(BrandGradient())
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 5, y: 5)    }
}

struct KBButton_Previews: PreviewProvider {
    static var previews: some View {
        KBButton(title: "Sign in")
    }
}
