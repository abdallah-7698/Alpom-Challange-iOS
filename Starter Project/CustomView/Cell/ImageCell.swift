//
//  ImageCell.swift
//  Starter Project
//
//  Created by Abdallah on 29/03/2023.
//

import UIKit

class ImageCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loadingIndecator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadingIndecator.startAnimating()
    }
    
    func setImage(from stringURL : String){
        imageView.setImage(from: stringURL){
            self.loadingIndecator.removeFromSuperview()
        }
    }

}
