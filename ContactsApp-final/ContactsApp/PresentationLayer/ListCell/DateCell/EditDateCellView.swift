//
//  EditDateCellView.swift
//  ContactsApp
//
//  Created by Pragath on 25/04/23.
//

import SwiftUI

struct EditDateCellView: View {
    
    @Binding var tag: String
    @Binding var entry: String
    
    @State var tagArray: [String]
    
    @State var tagIsSelected: Bool = false
    
    @Binding var toShowPicker: Bool
    @Binding var myDate: Date
    //@Binding var index: Int
    
    var name: String

    var body: some View {
        VStack{
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
                .onTapGesture {
                    tagIsSelected.toggle()
                }
                Divider()
                Text("\(entry)")
                    .onTapGesture {
                        toShowPicker.toggle()
                        
                    }
                Spacer()
            }
        }
        .onChange(of: myDate, perform: { newValue in
            entry = myDate.formatted(date: .abbreviated, time: .omitted)
        })
        .onAppear{
            entry = myDate.formatted(date: .abbreviated, time: .omitted)
        }
    }
}

struct EditDateCellView_Previews: PreviewProvider {
    static var previews: some View {
        EditDateCellView(tag: Binding.constant("Birthday"), entry: Binding.constant("Birthday"), tagArray: Constants.dateType, toShowPicker: .constant(true), myDate: .constant(Date()), name: "date")
    }
}
