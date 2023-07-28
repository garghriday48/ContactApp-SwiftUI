//
//  ContactsListView.swift
//  ContactsApp
//
//  Created by Pragath on 17/04/23.
//

import SwiftUI

struct ContactsListView: View {
    
    
    
    @ObservedObject var vm = ViewModel()
    @State private var searchText = ""
    @State private var isAddViewPresented = false
    @State private var toShowSection = false
    
    var body: some View {
        NavigationStack{

                ScrollViewReader { scrollProxy in
                    ZStack {
                        // MARK: display empty search view when thier is nothing that is matching to our searchText
                        if !searchText.isEmpty && vm.filteredData?.count == 0{
                            EmptySearchView(searchText: $searchText, toShowSection: $toShowSection)
                        }else{
                            //MARK: list to show contacts
                            List {
                                if searchText.isEmpty{
                                    ForEach(vm.sectionTitleArray , id: \.self) { letter in
                                        Section(header: Text(letter)) {
                                            ForEach(vm.contactDict[letter] ?? []){ contact in
                                                ZStack(alignment: .leading) {
                                                    NavigationLink {
                                                        DetailContactView(vm: vm, contact: contact)
                                                    } label: {
                                                        EmptyView()
                                                        
                                                    }
                                                    .opacity(0.0)
                                                    
                                                    if contact.getfullname() != ""{
                                                        Text(contact.getfullname())
                                                    }else if !contact.number.isEmpty{
                                                        Text(contact.number[0].mobileNumber)
                                                    }else{
                                                        Text(Constants.noName)
                                                            .italic()
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                //MARK: list to show contacts matching to searched text
                                else{
                                    Section(header: Text(Constants.searchSectionHeading)){
                                        ForEach(vm.sectionTitleArray , id: \.self) { letter in
                                            ForEach(vm.contactDict[letter] ?? []){ contact in
                                                ZStack(alignment: .leading) {
                                                    NavigationLink {
                                                        DetailContactView(vm: vm, contact: contact)
                                                    } label: {
                                                        EmptyView()
                                                        
                                                    }
                                                    .opacity(0.0)
                                                    
                                                    if contact.getfullname() != ""{
                                                        Text(contact.getfullname())
                                                    }else{
                                                        if !contact.number.isEmpty{
                                                            Text(contact.number[0].mobileNumber)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            .listStyle(PlainListStyle())
                        }
                        
                        if searchText.isEmpty{
                            VStack {
                                ForEach(vm.alphabet, id: \.self) { letter in
                                    HStack {
                                        Spacer()
                                        Button(action: {
                                            //need to figure out if there is a name in this section before I allow scroll to or it will crash
                                            if vm.filteredData?.first(where: { $0.getfullname().prefix(1) == letter  }) != nil{
                                                withAnimation {
                                                    scrollProxy.scrollTo(letter, anchor: .top)
                                                }
                                            }
                                        }, label: {
                                            Text(letter)
                                                .font(.system(size: 12))
                                                .padding(.trailing, 7)
                                        })
                                    }
                                }
                            }
                        }
                    }
                    .navigationTitle(Constants.contactsListHeading)
                    .toolbar{
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                isAddViewPresented.toggle()
                            } label: {
                                Image(systemName: Constants.plus)
                            }
                            .sheet(isPresented: $isAddViewPresented, onDismiss:{vm.getContacts()}){
                                AddContactView(vm: vm)
                            }
                        }
                    }
                    .onAppear{
                        vm.getContacts()
                    }

                    //MARK: searching of contacts logic
                    .searchable(text: $searchText,
                                    placement: SearchFieldPlacement.navigationBarDrawer(displayMode: .always))
                    .onChange(of: searchText){ text in
                        if !text.isEmpty{

                            vm.filteredData = vm.coreData.getAll()?.filter{
                                if $0.getfullname() != ""{
                                    return $0.firstName.uppercased().starts(with: searchText.uppercased()) || $0.lastName.uppercased().starts(with: searchText.uppercased())
                                }
                                //return nil
                                else{
                                    if $0.number.count != 0{
                                        return $0.number[0].mobileNumber.starts(with: searchText)
                                    }
                                    else{
                                        return false
                                    }
                                }
                            }
                            vm.sortContacts(in: vm.filteredData ?? [])
                        }
                        else{
                            vm.filteredData = vm.coreData.getAll()
                            vm.sortContacts(in: vm.filteredData ?? [])
                        }
                }
            }
        }
    }
}

struct Contacts_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ContactsListView()
        }
    }
}


