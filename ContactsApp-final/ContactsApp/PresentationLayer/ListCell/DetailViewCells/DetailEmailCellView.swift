//
//  DetailEmailCellView.swift
//  ContactsApp
//
//  Created by Pragath on 24/04/23.
//

import SwiftUI

struct DetailEmailCellView: View {
    @Binding var contact: ContactsModel
    
    var body: some View {
        
            VStack(alignment: .leading){
                ForEach(0..<contact.email.count,id: \.self){ email in
                    Text(contact.email[email].emailType)
                        .font(.subheadline)
                    Text(contact.email[email].email)
                        .foregroundColor(.blue)
                        .font(Font.body)
                }
                
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }


struct DetailEmailCellView_Previews: PreviewProvider {
    static var previews: some View {
        DetailNumberCellView(contact: .constant(ContactsModel(firstName: "", lastName: "Ryan", company: "1", number: [NumberModel(mobileNumber: "(446) 796-2839", mobileNumberType: "home")], email: [EmailModel(email: "we@gmail.com", emailType: "Other")], address: [AddressModel(street1: "", street2: "", city: "", state: "", zip: "", country: "", addressType: "Other")], date: [DateModel(date: "", dateType: "Birthday")], profilePic: Data(), notes: "hello", url: [UrlModel(url: "", urlType: "Twitter")], profile: [ProfileModel(profile: "", profileType: "Instagram")], message: [MessageModel(message: "", messsageType: "MSN")])))
    }
}
