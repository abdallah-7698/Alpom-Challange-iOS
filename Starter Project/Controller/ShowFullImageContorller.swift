//
//  ShowFullImageContorller.swift
//  Starter Project
//
//  Created by Abdallah on 30/03/2023.
//

import UIKit


class ShowFullImageContorller : UIViewController{
    
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    init(image : UIImage){
        super.init(nibName: nil, bundle: nil)
        configureUI()
        imageView.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(){
        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        imageView.fillSuperview()
    }
    
}
