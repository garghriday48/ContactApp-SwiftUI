//
//  AddContactView.swift
//  ContactsApp
//
//  Created by Pragath on 17/04/23.
//

import SwiftUI
import PhotosUI

struct AddContactView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var isEditing = false
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var companyName: String = ""
    
    @State private var isAlertShowing = false
    @State private var toShowPicker = false
    
    @State private var numberArray: [NumberModel] = []
    @State private var emailArray: [EmailModel] = []
    @State private var addressArray: [AddressModel] = []
    @State private var dateArray: [DateModel] = []
    @State private var urlArray: [UrlModel] = []
    @State private var profileArray: [ProfileModel] = []
    @State private var messageArray: [MessageModel] = []
    @State private var notes: String = ""
    
    @State private var selectedPic: Data = .init(count: 0)

//    @State private var myDate: Date = (Calendar.current.date(byAdding: DateComponents(year: 0), to: Date())) ?? Date()
    @State private var myDate = [Date]()
    @StateObject var vm: ViewModel
    @State var index = 0
   
    var body: some View {
        
        NavigationStack{
            
            ZStack{
                Color(.systemGray6)
                    .ignoresSafeArea()
                
                VStack{
                    //for photos
                    PhotoPickerView(selectedPic: $selectedPic)
                    //MARK:  list to display different components of add contact view
                    List{
                        
                        Section(header: Text("")) {
                            TextField(Constants.firstName, text: $firstName)
                                .autocorrectionDisabled()
                                .textInputAutocapitalization(.words)
                            TextField(Constants.lastName, text: $lastName)
                                .autocorrectionDisabled()
                                .textInputAutocapitalization(.words)
                            TextField(Constants.company, text: $companyName)
                                .autocorrectionDisabled()
                                .textInputAutocapitalization(.words)

                        }
                        
                        //MARK: phone section
                        Section(header: Text("")){
                            if numberArray.count > 0{
                                ForEach($numberArray){$num in
                                    EditEntityCellView(tag: $num.mobileNumType, entry: $num.mobileNumber, keyboardType: .phonePad, tagArray: Constants.phoneType, name: Constants.numPlaceholder)
                                    }
                                    .onDelete(perform: deleteNum)
                                }
                            
                            AddEntityCellView(name: Constants.phoneCellHeading)
                                    .onTapGesture {
                                        withAnimation {
                                            isEditing = true

                                            numberArray.append(NumberModel(mobileNumber: "", mobileNumberType:                         Constants.phoneType[numberArray.count % Constants.phoneType.count] ))
                                        }
                                    }
                        }
                        //MARK: email section
                        Section(header: Text("")){
                            if emailArray.count > 0{
                                ForEach($emailArray){$email in
                                    EditEntityCellView(tag: $email.emailType, entry: $email.email, keyboardType: .emailAddress, tagArray: Constants.emailType, name: Constants.mailPlaceholder)
                                    }
                                    .onDelete(perform: deleteEmail)
                                }
                            
                            AddEntityCellView(name: Constants.emailCellHeading)
                                    .onTapGesture {
                                        withAnimation {
                                            isEditing = true
                                            toShowPicker = false
                                            emailArray.append(EmailModel(email: "", emailType:                       Constants.emailType[emailArray.count % Constants.emailType.count] ))
                                        }
                                    }
                        }
                        
                        //MARK: url section
                        Section(header: Text("")){
                            if urlArray.count > 0{
                                ForEach($urlArray){$url in
                                    EditEntityCellView(tag: $url.urlType, entry: $url.url, keyboardType: .URL, tagArray: Constants.urlType, name: Constants.urlPlaceholder)
                                    }
                                    .onDelete(perform: deleteUrl)
                                }
                            
                            AddEntityCellView(name: Constants.urlCellHeading)
                                    .onTapGesture {
                                        withAnimation {
                                            isEditing = true
                                            toShowPicker = false
                                            urlArray.append(UrlModel(url: "", urlType: Constants.urlType[urlArray.count % Constants.urlType.count]))
                                        }
                                    }
                        }
                        //MARK: address section
                        Section(header: Text("")){
                            if addressArray.count > 0{
                                ForEach($addressArray){$address in
                                    EditAddressCellView(tag: $address.addressType, street1: $address.street1, street2: $address.street2, state: $address.state, city: $address.city, zip: $address.zip, country: $address.country, keyboardType: .default, zipKeyboardType: .numbersAndPunctuation, tagArray: Constants.addressType, street1Name: Constants.streetPlaceholder, street2Name: Constants.streetPlaceholder, stateName: Constants.statePlaceholder, cityName: Constants.cityPlaceholder, zipName: Constants.zipPlaceholder, countryName: Constants.countryPlaceholder)
                                    }
                                    .onDelete(perform: deleteAddress)
                                }
                            
                            AddEntityCellView(name: Constants.addressCellHeading)
                                    .onTapGesture {
                                        withAnimation {
                                            isEditing = true
                                            toShowPicker = false
                                            addressArray .append(AddressModel(street1: "", street2: "", city: "", state: "", zip: "", country: "", addressType: Constants.addressType[addressArray.count % Constants.addressType.count]))
                                        }
                                    }
                        }
                        
                        //MARK: date section
                        Section(header: Text("")){
                            if dateArray.count > 0{
                                ForEach($dateArray){$date in
                                    EditDateCellView(tag: $date.dateType, entry: $date.date, tagArray: Constants.dateType, toShowPicker: $toShowPicker, myDate: $myDate[index - 1], name: Constants.datePlaceholder)
                                
                                    }
                                    .onDelete(perform: deleteDate)
                                }
                            
                            AddEntityCellView(name: Constants.dateCellHeading)
                                    .onTapGesture {
                                        withAnimation {
                                            index += 1
                                            isEditing = true
                                            toShowPicker = false
                                            dateArray.append(DateModel(date: "", dateType: Constants.dateType[dateArray.count % Constants.dateType.count]))
                                            myDate.append(Date())
                                            
                                        }
                                    }
                        }
                        
                        //MARK: profile section
                        Section(header: Text("")){
                            if profileArray.count > 0{
                                ForEach($profileArray){$profile in
                                    EditEntityCellView(tag: $profile.profileType, entry: $profile.profile, keyboardType: .default, tagArray: Constants.profileType, name: Constants.profilePlaceholder)
                                    }
                                    .onDelete(perform: deleteProfile)
                                }
                            
                            AddEntityCellView(name: Constants.profileCellHeading)
                                    .onTapGesture {
                                        withAnimation {
                                            isEditing = true
                                            toShowPicker = false
                                            profileArray.append(ProfileModel(profile: "", profileType: Constants.profileType[profileArray.count % Constants.profileType.count]))
                                        }
                                    }
                        }
                        
                        //MARK: message section
                        Section(header: Text("")){
                            if messageArray.count > 0{
                                ForEach($messageArray){$message in
                                    EditEntityCellView(tag: $message.messsageType, entry: $message.message, keyboardType: .default, tagArray: Constants.messageType, name: Constants.messagePlaceholder)
                                    }
                                    .onDelete(perform: deleteMessage)
                                }
                            
                            AddEntityCellView(name: Constants.messageCellheading)
                                    .onTapGesture {
                                        withAnimation {
                                            isEditing = true
                                            toShowPicker = false
                                            messageArray.append(MessageModel(message: "", messsageType: Constants.messageType[messageArray.count % Constants.messageType.count]))
                                        }
                                    }
                        }
                        //MARK: Notes section
                        Section(header: Text("")) {
                            VStack(alignment: .leading){
                                Text(Constants.notesCellHeading)

                                TextEditor(text: $notes)
                                    .autocorrectionDisabled()
                                    .padding(.bottom)
                                

                            }
                        }

                    }
                    .scrollIndicators(.hidden)
                    .scrollDismissesKeyboard(.immediately)
                    .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))

                .listStyle(PlainListStyle())
                }
                .padding(.bottom, toShowPicker ? 200 : 20)
                if toShowPicker{
                    DatePickerView(myDate: $myDate[index - 1])
                }
            }
            
            .navigationTitle(Constants.addContactHeading)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(Constants.doneButton) {
                        
                        //logic to find out the arrays are not empty so as to create new contact in core data
                        var newNumArray: [NumberModel] = []
                        for i in 0..<numberArray.count{
                            if numberArray[i].mobileNumber != ""{
                                newNumArray.append(numberArray[i])
                            }
                        }
                        
                        var newEmailArray: [EmailModel] = []
                        for i in 0..<emailArray.count{
                            if emailArray[i].email != ""{
                                newEmailArray.append(emailArray[i])
                            }
                        }
                        var newAddressArray: [AddressModel] = []
                        for i in 0..<addressArray.count{
                            if addressArray[i].street1 != "" || addressArray[i].street2 != "" || addressArray[i].state != "" || addressArray[i].city != "" || addressArray[i].zip != "" || addressArray[i].country != ""{
                                newAddressArray.append(addressArray[i])
                            }
                        }
                        var newDateArray: [DateModel] = []
                        for i in 0..<dateArray.count{
                            if dateArray[i].date != ""{
                                newDateArray.append(dateArray[i])
                            }
                        }
                        var newUrlArray: [UrlModel] = []
                        for i in 0..<urlArray.count{
                            if urlArray[i].url != ""{
                                newUrlArray.append(urlArray[i])
                            }
                        }
                        var newProfileArray: [ProfileModel] = []
                        for i in 0..<profileArray.count{
                            if profileArray[i].profile != ""{
                                newProfileArray.append(profileArray[i])
                            }
                        }
                        var newMessageArray: [MessageModel] = []
                        for i in 0..<messageArray.count{
                            if messageArray[i].message != ""{
                                newMessageArray.append(messageArray[i])
                            }
                        }
                        // logic for creating a new contact in coredata
                        if firstName != "" || lastName != "" || companyName != "" || !newNumArray.isEmpty || !newEmailArray.isEmpty || !selectedPic.isEmpty || !newDateArray.isEmpty || !newProfileArray.isEmpty || !newUrlArray.isEmpty || !newMessageArray.isEmpty{
                            vm.coreData.create(contact: ContactsModel(firstName: firstName, lastName: lastName, company: companyName, number: newNumArray, email: newEmailArray, address: newAddressArray, date: newDateArray, profilePic: selectedPic, notes: notes, url: newUrlArray, profile: newProfileArray, message: newMessageArray))
                        }
                        dismiss()
                        }
                    }
                    
                // alert sheet code for when cancel button is pressed
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(Constants.cancelButton) {
                        
                        isAlertShowing.toggle()
                    }
                    .actionSheet(isPresented: $isAlertShowing) {
                        ActionSheet(title: Text(Constants.deleteAlertHeading), buttons: [
                            .destructive(Text(Constants.discardButton)){
                                dismiss()
                            },
                            .cancel(Text(Constants.keepEditingButton))
                        ])
                        
                    }
                }
            }
        }
    }
}


struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView(vm: ViewModel())
    }
}

//extension that contains functions to remove from array based on offsets
extension AddContactView{
    
    func deleteNum(at offsets: IndexSet) {
        numberArray.remove(atOffsets: offsets)
        }
    func deleteEmail(at offsets: IndexSet) {
        emailArray.remove(atOffsets: offsets)
        }
    func deleteAddress(at offsets: IndexSet) {
        addressArray.remove(atOffsets: offsets)
        }
    func deleteDate(at offsets: IndexSet) {
        dateArray.remove(atOffsets: offsets)
        }
    func deleteUrl(at offsets: IndexSet) {
        urlArray.remove(atOffsets: offsets)
        }
    func deleteMessage(at offsets: IndexSet) {
        messageArray.remove(atOffsets: offsets)
        }
    func deleteProfile(at offsets: IndexSet) {
        profileArray.remove(atOffsets: offsets)
        }
}
