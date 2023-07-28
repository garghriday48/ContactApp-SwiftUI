//
//  DatePickerView.swift
//  ContactsApp
//
//  Created by Pragath on 25/04/23.
//

import SwiftUI

struct DatePickerView: View {
    
    @Binding var myDate: Date
    
    var body: some View {
        VStack{
                Spacer()

                DatePicker(selection: $myDate, in: ...myDate, displayedComponents: .date, label: {})
                    .labelsHidden()
                    
                    .datePickerStyle(WheelDatePickerStyle())
                    .frame(maxWidth: .infinity, maxHeight: 200 ,alignment: .center)
                    .background(.gray.opacity(0.4))
                    
            
        }
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView(myDate: .constant(Date()))
    }
}
