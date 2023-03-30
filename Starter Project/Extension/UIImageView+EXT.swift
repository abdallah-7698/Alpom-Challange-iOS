//
//  UIImageView+EXT.swift
//  Starter Project
//
//  Created by Abdallah on 30/03/2023.
//

import UIKit

extension UIImageView{
    
    func setImage(from StringURL : String, complection : (() -> Void)?){
        NetworkingManager.shared.downloadImage(from: StringURL) {[weak self] image in
            guard let self = self else {return}
            guard let image = image
            else
            {
                self.image = UIImage(named: "Asset 1")
                complection?()
                return
            }
            DispatchQueue.main.async {
                self.image = image
                complection?()
            }
        }
    }
    
}
