//
//  AddPhoneCellView.swift
//  ContactsApp
//
//  Created by Pragath on 17/04/23.
//

import SwiftUI

struct AddEntityCellView: View {
    var name: String
    var body: some View {
        HStack{
            Image(systemName: Constants.plusFill)
                .foregroundColor(.green)
            Text(name)
            Spacer()

        }
        .frame(maxWidth: .infinity)
    }
}

struct AddEntityCellView_Previews: PreviewProvider {
    static var previews: some View {
        AddEntityCellView(name: "add phone")
    }
}
