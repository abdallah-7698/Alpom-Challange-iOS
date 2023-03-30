//
//  ShowFullImageContorller.swift
//  Starter Project
//
//  Created by Abdallah on 30/03/2023.
//

import UIKit


class ShowFullImageContorller : CustomDataLoadingVC{
    
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    init(imageURL : String){
        super.init(nibName: nil, bundle: nil)
        configureUI()
        setImage(from: imageURL)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(){
        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        imageView.fillSuperview()
    }
    
    fileprivate func setImage(from imageURL: String){
        showLoadingView()
        imageView.setImage(from: imageURL) { [weak self] in
            guard let self = self else {return}
            self.dismissLoadingView()
        }
    }
    
}
