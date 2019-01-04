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
    let atomic_mass: Int
    let boil: Int
    let discovered_by: String
    let melt: Int
    let spectral_img: URL
    let number: Int
}
