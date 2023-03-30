//
//  CustomDataLoadingVC.swift
//  Starter Project
//
//  Created by Abdallah on 30/03/2023.
//

import UIKit

class CustomDataLoadingVC: UIViewController {

    private var containerView : UIView!
    
    func showLoadingView(){
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor   = .systemBackground
        containerView.alpha             = 0
        
        UIView.animate(withDuration: 0.25) { self.containerView.alpha = 0.8  }
        
        let activityIndecator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndecator)
        activityIndecator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndecator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            activityIndecator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        
        activityIndecator.startAnimating()
        
    }
    
    func dismissLoadingView(){
        DispatchQueue.main.async {
            self.containerView.removeFromSuperview()
            self.containerView = nil
        }
    }
    
    func showErrorAlert(with message: String, title: String = "Error") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
}
