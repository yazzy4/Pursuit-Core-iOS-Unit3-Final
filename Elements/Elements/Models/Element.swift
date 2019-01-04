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
