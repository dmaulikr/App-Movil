//
//  exercises.swift
//  CollectionViewProgram
//
//  Created by Rafael Colon Maldonado on 5/24/17.
//  Copyright © 2017 Rafael Colon Maldonado. All rights reserved.
//

import Foundation
import UIKit

class exercises {
    init(rutine: [String], dificulty: Int, description: String) {
        self.rutine = rutine
        self.dificulty = dificulty
        self.Description = description
        //self.image = image
    }
    var rutine: [String]
    var dificulty: Int
    var Description: String
    //var image: UIImage
}
