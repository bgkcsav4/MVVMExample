//
//  PersonFollowingTableViewCellModel.swift
//  MVVMExample
//
//  Created by Mariam Latsabidze on 12.12.21.
//

import Foundation
import UIKit

struct PersonFollowingTableViewCellModel {
    let name: String 
    let username: String
    var currentlyFollowing: Bool
    let image: UIImage?
    
    init(with model : Person){
        name = model.name
        username = model.username
        currentlyFollowing = false
        image = UIImage(systemName: "person")
    }
}
