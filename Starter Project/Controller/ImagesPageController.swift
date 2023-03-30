//
//  ImagesPageController.swift
//  Starter Project
//
//  Created by Abdallah on 29/03/2023.
//

import UIKit

class ImagesPageController: UIViewController {
    
    var mainView : ImagesPageView!    
    
    private var activityIndecator = CustomIndecator()
    
    override func loadView() {
        super.loadView()
        mainView = ImagesPageView(frame : view.frame)
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
        view.addSubview(activityIndecator)
        activityIndecator.fillSuperview()
        activityIndecator.start()
        
        requestImageURL {[weak self] result in
            guard let self = self else {return}
            self.activityIndecator.stop()
            switch result{
            case .success(let value):
                self.mainView.imagesURL = value.map({ $0.urls.regular})
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    func requestImageURL(completion : @escaping(Result<[ImageModel],Error>)->Void){
        let request = URLRequestBuilder(route: .rundomPhotos)
            .addQueryItem(name: "page", value: "1")
            .addQueryItem(name: "order_by", value: "latest")
            .addQueryItem(name: "count", value: "10")
            .addQueryItem(name: "client_id", value: "Ahj-66mbyiRNL-GhTltHoIgGfkznNgv7SALhCOTLMaM")
            .build()
        print(request)
        Task{
            do {
                let photo = try await NetworkingManager.shared.execute(request: request, responseType: [ImageModel].self)
                completion(.success(photo))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
}

extension ImagesPageController : ImagesPageViewProtocol  {
    func showFullImageViewController(image: UIImage) {
        let vc = ShowFullImageContorller(image: image)
        present(vc, animated: true)
    }
}
