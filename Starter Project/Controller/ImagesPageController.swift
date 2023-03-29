//
//  ImagesPageController.swift
//  Starter Project
//
//  Created by Abdallah on 29/03/2023.
//

import UIKit

class ImagesPageController: UIViewController {
    
    let mainView = ImagesPageView()
    
    override func loadView() {
        super.loadView()
        mainView.frame = view.frame
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestImageURL {[weak self] result in
            guard let self = self else {return}
            switch result{
            case .success(let value):
                self.mainView.imagesURL = value.map({ $0.urls.full})
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
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
