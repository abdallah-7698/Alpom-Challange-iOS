//
//  Route.swift
//  Starter Project
//
//  Created by Abdallah on 29/03/2023.
//

import Foundation

enum Route : String {
    
    static let baseURL = "https://api.unsplash.com/"
    
    case rundomPhotos
    
    var stringURL : String {
        switch self {
        case .rundomPhotos:
            return Route.baseURL + "/photos/random"
        }
    }
    
}
