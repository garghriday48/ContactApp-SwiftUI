//
//  EmptySearchView.swift
//  ContactsApp
//
//  Created by Pragath on 17/04/23.
//

import SwiftUI

struct EmptySearchView: View {
    
    @Binding var searchText: String
    @Binding var toShowSection: Bool
    
    var body: some View {
        VStack{
            Image(systemName: Constants.magnifyingGlass)
                .resizable()
                .frame(width: 70, height: 70)
                .foregroundColor(.gray)
            Text(Constants.emptyViewText1 + "\"\(searchText)\"")
                .font(.title)
                .bold()
            Text(Constants.emptyViewText2)
                .foregroundColor(.gray)
        }
        .onAppear{
            toShowSection.toggle()
        }
        
    }
}
