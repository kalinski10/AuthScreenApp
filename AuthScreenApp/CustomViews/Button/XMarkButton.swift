//
//  XMarkButton.swift
//  AuthScreenApp
//
//  Created by Kalin Balabanov on 18/02/2021.
//

import SwiftUI

struct XMarkButton: View {
    
    var body: some View {
        Image(systemName: "xmark")
            .resizable()
            .padding()
            .frame(width: 44, height: 44)
            .background(Color.black.opacity(0.6))
            .clipShape(Circle())
    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton(isShowing: .constant(true))
    }
}
