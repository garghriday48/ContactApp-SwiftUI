//
//  DetailContactView.swift
//  ContactsApp
//
//  Created by Pragath on 18/04/23.
//

import SwiftUI

struct DetailContactView: View {
    
    @Environment (\.dismiss) var dismiss
    
    @StateObject var vm: ViewModel
    @State var contact: ContactsModel
    
    @State var deletingToRoot: Bool = false
    @State private var selectedPic: Data = .init(count: 0)
    
    var body: some View {
        ZStack{
            Color(.systemGray6)
                .ignoresSafeArea()
            VStack{
                VStack{
                    if let image = UIImage(data: contact.profilePic) {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 125, height: 125)
                            .clipShape(Circle())
                            .foregroundColor(.gray)
                            .padding(.top)
                    }else{
                        Image(systemName: Constants.personFill)
                            .resizable()
                            .frame(width: 125, height: 125)
                            .foregroundColor(.gray)
                            .padding(.top)
                    }
                    Text(contact.getfullname())
                        .font(.title)
                    if contact.getfullname() != contact.company{
                        Text(contact.company)
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    
                    GeometryReader{ geometry in
                        HStack(alignment: .center){
                            
                            InfoBoxView(imageName: Constants.message, image: Constants.messageText, size: geometry.size.width/3.48)
                            InfoBoxView(imageName: Constants.phone, image: Constants.phoneText, size: geometry.size.width/3.48)
                            InfoBoxView(imageName: Constants.mail, image: Constants.mailText, size: geometry.size.width/3.48)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .frame(height: 100)
                }
                //.offset(y: -50)
                List{
                    if !contact.number.isEmpty{
                        Section{
                            DetailNumberCellView(contact: $contact)
                        }
                    }
                    
                    if !contact.email.isEmpty{
                        Section{
                            DetailEmailCellView(contact: $contact)
                        }
                    }
                    
                    if !contact.url.isEmpty{
                        Section{
                            DetailUrlCellView(contact: $contact)
                        }
                    }
                    
                    if !contact.address.isEmpty{
                        Section{
                            DetailAddressCellView(contact: $contact)
                        }
                    }
                    
                    if !contact.date.isEmpty{
                        Section{
                            DetailDateCellView(contact: $contact)
                        }
                    }

                    if !contact.profile.isEmpty{
                        Section{
                            DetailProfileCellView(contact: $contact)
                        }
                    }
                    
                    if !contact.message.isEmpty{
                        Section{
                            DetailMessageCellView(contact: $contact)
                        }
                    }
                    
                    Section{
                        //Text()
                        Text(Constants.notesCellHeading + "\n" + "\(contact.notes)")
                    }
                    Section{
                        Button(action: {}, label: {
                            Text(Constants.sendMessage)
                                .foregroundColor(.blue)
                        })
                        Button(action: {}, label: {
                            Text(Constants.shareContact)
                                .foregroundColor(.blue)
                        })
                        Button(action: {}, label: {
                            Text(Constants.addToFav)
                                .foregroundColor(.blue)
                        })
                    }
                    
                    Section{
                        Button(action: {}, label: {
                            Text(Constants.addToEmergencyCont)
                                .foregroundColor(.blue)
                        })
                        
                        
                    }
                    
                }
                .scrollIndicators(.hidden)
                .listStyle(.insetGrouped)

                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            
            if deletingToRoot == false{
                contact = vm.coreData.get(byIdentifier: contact.id)!
            }else{
                dismiss()
            }
        }
        .toolbar{
            ToolbarItem{
                NavigationLink(destination: EditContactView(vm: vm, contact: $contact, deletingToRoot: $deletingToRoot), label: {Text(Constants.edit)})
            }
            
        }
    }
}

struct DetailContactView_Previews: PreviewProvider {
    static var previews: some View {
        DetailNumberCellView(contact: .constant(ContactsModel(firstName: "", lastName: "Ryan", company: "1", number: [NumberModel(mobileNumber: "(446) 796-2839", mobileNumberType: "home")], email: [EmailModel(email: "we@gmail.com", emailType: "Other")], address: [AddressModel(street1: "", street2: "", city: "", state: "", zip: "", country: "", addressType: "Other")], date: [DateModel(date: "", dateType: "Birthday")], profilePic: Data(), notes: "hello", url: [UrlModel(url: "", urlType: "Twitter")], profile: [ProfileModel(profile: "", profileType: "Instagram")], message: [MessageModel(message: "", messsageType: "MSN")])))
    }
}


struct InfoBoxView: View {
    var imageName: String
    var image: String
    var size: Double
    
    var body: some View {
            VStack{
                Image(systemName: imageName)
                    .font(.title2)
                Text(image)
                    .font(.callout)
            }
            .foregroundColor(Color(.systemGray4))
            
            .frame(width: size ,height: 70)
            .background(.white)
            .cornerRadius(10)
            .padding(.top)
    }
}
