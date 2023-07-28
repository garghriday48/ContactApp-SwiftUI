//
//  DetailProfileCellView.swift
//  ContactsApp
//
//  Created by Pragath on 26/04/23.
//

import SwiftUI

struct DetailProfileCellView: View {
    @Binding var contact: ContactsModel
    
    var body: some View {

            VStack(alignment: .leading){
                ForEach(0..<contact.profile.count,id: \.self){ profile in
                    Text(contact.profile[profile].profileType)
                        .font(.subheadline)
                    Text(contact.profile[profile].profile)
                        .foregroundColor(.blue)
                        .font(Font.body)
                }
                
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
}


