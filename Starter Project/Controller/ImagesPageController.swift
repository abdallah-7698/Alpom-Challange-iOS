//
//  ImagesPageController.swift
//  Starter Project
//
//  Created by Abdallah on 29/03/2023.
//

import UIKit

class ImagesPageController: CustomDataLoadingVC {
    
    
    var mainView : ImagesPageView!
    
    fileprivate var page : Int = 0
    
    override func loadView() {
        super.loadView()
        mainView = ImagesPageView(frame : view.frame)
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
        showLoadingView()
        getImagesURL(page: page)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    func getImagesURL(page : Int){
        NetworkingManager.shared.requestImageURL(page: page) {[weak self] result in
            guard let self = self else {return}
            self.dismissLoadingView()
            switch result{
            case .success(let value):
                DispatchQueue.main.async {
                    self.mainView.imageModelArray.append(contentsOf: value)
                }            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

extension ImagesPageController : ImagesPageViewProtocol  {
    
    func getMoreImages() {
        // the image count = 1000 and the page has 20 so image in between 0 and 49
        if page < 50 {
            page += 1
            getImagesURL(page: page)
        }
    }
    
    func showFullImageViewController(fullImageStringURL: String) {
        let vc = ShowFullImageContorller(imageURL: fullImageStringURL)
        present(vc, animated: true)
    }
}
