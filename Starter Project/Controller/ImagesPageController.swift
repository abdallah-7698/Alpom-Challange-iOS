//
//  ImagesPageController.swift
//  Starter Project
//
//  Created by Abdallah on 29/03/2023.
//

import UIKit

class ImagesPageController: UIViewController {

    
    override func loadView() {
        super.loadView()
        let mainView = ImagesPageView(frame: view.frame)
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
}
