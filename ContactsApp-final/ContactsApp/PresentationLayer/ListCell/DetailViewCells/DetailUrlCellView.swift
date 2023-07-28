//
//  DetailUrlCellView.swift
//  ContactsApp
//
//  Created by Pragath on 26/04/23.
//

import SwiftUI

struct DetailUrlCellView: View {
    @Binding var contact: ContactsModel
    
    var body: some View {

            VStack(alignment: .leading){
                ForEach(0..<contact.url.count,id: \.self){ url in
                    Text(contact.url[url].urlType)
                        .font(.subheadline)
                    Text(contact.url[url].url)
                        .foregroundColor(.blue)
                        .font(Font.body)
                }
                
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
}
