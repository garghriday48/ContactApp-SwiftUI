//
//  PhotoPickerVIew.swift
//  ContactsApp
//
//  Created by Pragath on 21/04/23.
//

import SwiftUI
import _PhotosUI_SwiftUI

struct PhotoPickerView: View {
    
    
    @Binding var selectedPic: Data
    @State private var selectedItems: [PhotosPickerItem] = []
    
    var body: some View {
        VStack{
            PhotosPicker(
                selection: $selectedItems,
                maxSelectionCount: 1,
                matching: .images
            ){
                if selectedItems.count != 0 {
                    if let data = selectedPic, let uiImage = UIImage(data: data ) {
                        VStack{
                            Image(uiImage: uiImage)
                                .resizable()
                                .frame(width:150, height: 150)
                                .clipShape(Circle())
                                .padding(.top)
                            
                            Text(Constants.editImage)
                        }
                    }
                    else {
                        VStack{
                            Image(systemName: Constants.personFill)
                                .resizable()
                                .frame(width:150, height: 150)
                                .foregroundColor(.gray)
                                .padding(.top)
                            
                            Text(Constants.addImage)
                        }
                    }
                }else {
                    if let data = selectedPic, let uiImage = UIImage(data: data ) {
                        VStack{
                            Image(uiImage: uiImage)
                                .resizable()
                                .frame(width:150, height: 150)
                                .clipShape(Circle())
                                .padding(.top)
                            
                            Text(Constants.editImage)
                        }
                    }
                    else {
                        VStack{
                            Image(systemName: Constants.personFill)
                                .resizable()
                                .frame(width:150, height: 150)
                                .foregroundColor(.gray)
                                .padding(.top)
                            
                            Text(Constants.addImage)
                        }
                    }
                }
            }
        }
        .onChange(of: selectedItems) { newValue in
            guard let items = selectedItems.first else{return
                
            }
            items.loadTransferable(type: Data.self){ result in
                switch result{
                case .success(let data):
                    if let data = data{
                        selectedPic = data
                    }else{
                        print("no data")
                    }
                case .failure(let error):
                    fatalError("\(error)")
                }
            }
        }
    }
}

struct PhotoPickerView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPickerView(selectedPic: .constant(Data(count: 0)))
    }
}
