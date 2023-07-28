//
//  DetailMessageCellView.swift
//  ContactsApp
//
//  Created by Pragath on 26/04/23.
//

import SwiftUI

struct DetailMessageCellView: View {
    @Binding var contact: ContactsModel
    
    var body: some View {

            VStack(alignment: .leading){
                ForEach(0..<contact.message.count,id: \.self){ msg in
                    Text(contact.message[msg].messsageType)
                        .font(.subheadline)
                    Text(contact.message[msg].message)
                        .foregroundColor(.blue)
                        .font(Font.body)
                }
                
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
}
