//
//  EditCellView.swift
//  ContactsApp
//
//  Created by Pragath on 25/04/23.
//

import SwiftUI

struct EditAddressCellView: View {
    @Binding var tag: String
    
    @Binding var street1: String
    @Binding var street2: String
    @Binding var state: String
    @Binding var city: String
    @Binding var zip: String
    @Binding var country: String
    
    @State var keyboardType: UIKeyboardType
    @State var zipKeyboardType : UIKeyboardType
    @State var tagArray: [String]
    
    @State var tagIsSelected: Bool = false
    
    var street1Name: String
    var street2Name: String
    var stateName: String
    var cityName: String
    var zipName: String
    var countryName: String
    
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
            .onTapGesture {
                tagIsSelected.toggle()
            }
            VStack{

                HStack{
                    Divider()
                    TextField(street1Name, text: $street1)
                        .keyboardType(keyboardType)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.words)
                }
                Divider()
                HStack{
                    Divider()
                    TextField(street2Name, text: $street2)
                        .keyboardType(keyboardType)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.words)
                }
                Divider()
                HStack{
                    Divider()
                    TextField(cityName, text: $city)
                        .keyboardType(keyboardType)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.words)
                }
                Divider()
                HStack{
                    Divider()
                    TextField(stateName, text: $state)
                        .keyboardType(keyboardType)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.words)

                    Divider()
                    TextField(zipName, text: $zip)
                        .keyboardType(zipKeyboardType)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.words)

                }
                Divider()
                HStack{
                    Divider()
                    TextField(countryName, text: $country)
                        .keyboardType(keyboardType)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.words)
                }
            }
        }
    }
}

struct EditCellView_Previews: PreviewProvider {
    static var previews: some View {
        EditAddressCellView(tag: Binding.constant("Main"), street1: Binding.constant("Main"), street2: Binding.constant("Main"), state: Binding.constant("Main"), city: Binding.constant("Main"), zip: Binding.constant("Main"), country: Binding.constant("Main"), keyboardType: .default, zipKeyboardType: .numbersAndPunctuation, tagArray: ["Other"], street1Name: "street", street2Name: "street", stateName: "state", cityName: "city", zipName: "zip", countryName: "country")
    }
}

