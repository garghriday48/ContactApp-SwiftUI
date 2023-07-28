//
//  NumberCellView.swift
//  ContactsApp
//
//  Created by Pragath on 24/04/23.
//

import SwiftUI

struct EditEntityCellView: View {
    
    @Binding var tag: String
    @Binding var entry: String
    
    @State var keyboardType: UIKeyboardType
    @State var tagArray: [String]
    
    @State var tagIsSelected: Bool = false
    
    var name: String
    
    var body: some View {
        HStack{
            HStack{
                Text(tag)
                    .foregroundColor(Color.blue)
                
                    .sheet(isPresented: $tagIsSelected) {
                        TagPickerView(selectedTag: $tag, tagArray: $tagArray)
                        
                    }
                Image(systemName: Constants.right)
                    .foregroundColor(.gray)
            }
            .frame(alignment: .trailing)
            .onTapGesture {
                tagIsSelected.toggle()
            }
            Divider()
            TextField(name, text: $entry)
                .keyboardType(keyboardType)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.words)
            Spacer()
        }
    }
}

struct NumberCellView_Previews: PreviewProvider {
    static var previews: some View {
        EditEntityCellView(tag: .constant("Apple Watch"), entry: .constant(""), keyboardType: .default, tagArray: ["Other", "Phone"], name: "phone")

    }
}
