//
//  Element.swift
//  Elements
//
//  Created by Yaz Burrell on 1/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Element: Codable {
    let name: String
    let atomic_mass: Double
    let boil: Double?
    let discovered_by: String?
    let melt: Double?
    let spectral_img: URL?
    let number: Int
    
}

let thumbnailImage: String = "http://www.theodoregray.com/periodictable/Tiles/ElementNumberWithThreeDigits/s7.JPG"
let largeImage: String = "http://images-of-elements.com/lowercasedElementName.jpg"

