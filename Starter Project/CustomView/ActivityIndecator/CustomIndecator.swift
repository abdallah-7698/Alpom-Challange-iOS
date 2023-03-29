//
//  CustomIndecator.swift
//  Starter Project
//
//  Created by Abdallah on 29/03/2023.
//

import UIKit

class CustomIndecator: UIActivityIndicatorView {
    
    init(){
        super.init(frame: .zero)
        configureUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureUI(){
        style = .large
        center = center
    }
    
    func start(){
        startAnimating()
    }
    
    func stop(){
        stopAnimating()
    }
}
