//
//  Models.swift
//  MVVMExample
//
//  Created by Mariam Latsabidze on 12.12.21.
//

import Foundation


enum Gender {
    case female, male, unspecified
}

struct Person{
    let name: String
    let address: String
    let gender: Gender
    
    var username = "David Bowie"
    
    
    init(name: String, address: String? = nil, gender: Gender? = .unspecified) {
        self.name = name
        self.address = address ?? ""
        self.gender = gender ?? .unspecified
    }
}


