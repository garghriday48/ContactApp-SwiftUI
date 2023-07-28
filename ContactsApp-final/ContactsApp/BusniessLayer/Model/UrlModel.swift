//
//  UrlModel.swift
//  ContactsApp
//
//  Created by Pragath on 26/04/23.
//

import Foundation

class UrlModel: Identifiable{

    var id: UUID
    var url: String
    var urlType: String
    
    init(url: String, urlType: String) {
        self.id = UUID()
        self.url = url
        self.urlType = urlType
    }
}
