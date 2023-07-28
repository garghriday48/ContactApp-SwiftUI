//
//  TagPickerView.swift
//  ContactsApp
//
//  Created by Pragath on 18/04/23.
//

import SwiftUI

struct TagPickerView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var selectedTag: String
    @Binding var tagArray: [String]
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(.systemGray6)
                    .ignoresSafeArea()
                VStack{
                    List{
                        ForEach(tagArray, id:\.self){tag in
                            HStack{
                                Text(tag)
                                Spacer()
                                if tag == selectedTag {
                                    Image(systemName: Constants.checkmark)
                                        .foregroundColor(.blue)
                                }
                            }

                            .frame(maxWidth: .infinity)
                            .onTapGesture {
                                withAnimation{
                                    selectedTag = tag
                                    dismiss()
                                }
                            }
                            
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(Constants.cancelButton) {
                            dismiss()
                        }
                    }
                }
                .navigationTitle(Constants.tagsHeading)
                .navigationBarTitleDisplayMode(.inline)
                
            }
        }
    }
}

struct TagPickerView_Previews: PreviewProvider {
    static var previews: some View {
        TagPickerView(selectedTag: .constant("Other"), tagArray: .constant(["Other","Phone"]))
    }
}
