//
//  CollectionViewCell+EXT.swift
//  Starter Project
//
//  Created by Abdallah on 29/03/2023.
//

import UIKit

protocol ReuseIdentifiable {
    static var reuseIdentifier : String {get}
}

extension ReuseIdentifiable {
    static var reuseIdentifier : String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReuseIdentifiable {}

