//
//  DetailNumberCellView.swift
//  ContactsApp
//
//  Created by Pragath on 18/04/23.
//

import SwiftUI

struct DetailNumberCellView: View {
    
    @Binding var contact: ContactsModel
    
    var body: some View {

            VStack(alignment: .leading){
                ForEach(0..<contact.number.count,id: \.self){ num in
                    Text(contact.number[num].mobileNumType)
                        .font(.subheadline)
                    Text(contact.number[num].mobileNumber)
                        .foregroundColor(.blue)
                        .font(Font.body)
                }
                
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }


struct DetailNumberCellView_Previews: PreviewProvider {
    static var previews: some View {
        DetailNumberCellView(contact: .constant(ContactsModel(firstName: "", lastName: "Ryan", company: "1", number: [NumberModel(mobileNumber: "(446) 796-2839", mobileNumberType: "home")], email: [EmailModel(email: "we@gmail.com", emailType: "Other")], address: [AddressModel(street1: "", street2: "", city: "", state: "", zip: "", country: "", addressType: "Other")], date: [DateModel(date: "", dateType: "Birthday")], profilePic: Data(), notes: "hello", url: [UrlModel(url: "", urlType: "Twitter")], profile: [ProfileModel(profile: "", profileType: "Instagram")], message: [MessageModel(message: "", messsageType: "MSN")])))
    }
}
