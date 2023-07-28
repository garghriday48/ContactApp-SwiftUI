//
//  DetailAddressCellVIew.swift
//  ContactsApp
//
//  Created by Pragath on 25/04/23.
//

import SwiftUI

struct DetailAddressCellView: View {
    
    @Binding var contact: ContactsModel
    
    var body: some View {

            VStack(alignment: .leading){
                ForEach(contact.address){ address in
                    
                    Text(address.addressType)
                        .font(.subheadline)
                    if address.street1 != ""{
                        Text(address.street1)
                            .font(.body)
                    }
                    if address.street2 != ""{
                        Text(address.street2)
                            .font(Font.body)
                    }
                    if address.city != "" || address.state != ""{
                        Text(address.city + " " + address.state)
                            .font(Font.body)
                    }
                    
                    if address.zip != ""{
                        Text(address.zip)
                            .font(Font.body)
                    }
                    if address.country != ""{
                        Text(address.country)
                            .font(Font.body)
                    }
                }
                
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }


struct DetailAddressCellView_Previews: PreviewProvider {
    static var previews: some View {
        DetailAddressCellView(contact: .constant(ContactsModel(firstName: "", lastName: "Ryan", company: "1", number: [NumberModel(mobileNumber: "(446) 796-2839", mobileNumberType: "home")], email: [EmailModel(email: "we@gmail.com", emailType: "Other")], address: [AddressModel(street1: "165 Davis Street", street2: "", city: "Hillsborough", state: "CA", zip: "94010", country: "United States", addressType: "Other")], date: [DateModel(date: "", dateType: "Birthday")], profilePic: Data(), notes: "hello", url: [UrlModel(url: "", urlType: "Twitter")], profile: [ProfileModel(profile: "", profileType: "Instagram")], message: [MessageModel(message: "", messsageType: "MSN")])))
    }
}
