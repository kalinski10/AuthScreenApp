//
//  MenuCell.swift
//  AuthScreenApp
//
//  Created by Kalin Balabanov on 18/02/2021.
//

import SwiftUI

struct Option: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    
    static let options: [Option] = [ Option(imageName: "person", title:"Account"),
                                     Option(imageName: "gearshape", title:"Settings"),
                                     Option(imageName: "music.note", title:"Music"),
                                     Option(imageName: "4k.tv", title:"Videos"),
                                     Option(imageName: "hand.raised.slash", title:"Privacy")]
}


struct MenuCell: View {
    @AppStorage("user") private var user: String?
    let imageName: String
    let title: String
    
    var body: some View {
        HStack {
            Button {
                print(title)
                
            } label: {
                Image(systemName: imageName)
                    .resizable()
                    .clipped()
                    .frame(width: 25, height: 25)
                
                Text(title)
            }
        }
        .padding()
    }
}

struct MenuCell_Previews: PreviewProvider {
    static var previews: some View {
        MenuCell(imageName: "xmark", title: "title")
    }
}
