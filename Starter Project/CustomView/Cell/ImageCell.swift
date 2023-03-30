//
//  ImageCell.swift
//  Starter Project
//
//  Created by Abdallah on 29/03/2023.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
   fileprivate let selectionOverlay = UIView()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                selectionOverlay.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
                contentView.addSubview(selectionOverlay)
                selectionOverlay.frame = contentView.bounds
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.isSelected = false
                }
            } else {
                selectionOverlay.removeFromSuperview()
            }
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loadingIndecator: UIActivityIndicatorView!
    

    
    func setImage(from stringURL : String){
        loadingIndecator.startAnimating()
        isUserInteractionEnabled = false
        imageView.setImage(from: stringURL){
            self.isUserInteractionEnabled = true
            self.loadingIndecator.stopAnimating()
            self.loadingIndecator.removeFromSuperview()
        }
    }
    
}
