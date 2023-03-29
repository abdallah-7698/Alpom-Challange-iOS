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

        requestData()
        
    }

    func requestData(){

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
            } catch {
                print(error)
            }
        }
    }
    
    
}
