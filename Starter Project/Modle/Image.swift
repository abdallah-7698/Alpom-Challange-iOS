//
//  Image.swift
//  Starter Project
//
//  Created by Abdallah on 29/03/2023.
//

import Foundation

// MARK: - ImageModelElement
struct ImageModel : Codable {
    let urls: Urls
}


// MARK: - Urls
struct Urls : Codable {
    let raw, full, regular, small: String?
    let thumb, smallS3: String?
}


