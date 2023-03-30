//
//  NetworkManager+EXT.swift
//  Starter Project
//
//  Created by Abdallah on 30/03/2023.
//

import Foundation

/// All the func that works On Images Page Controller 

extension NetworkingManager{
    
    func requestImageURL(page : Int, completion : @escaping(Result<[ImageModel],Error>)->Void){
        let request = URLRequestBuilder(route: .rundomPhotos)
            .addQueryItem(name: "page", value: "\(page)")
            .addQueryItem(name: "per_page", value: "20")
            .addQueryItem(name: "order_by", value: "latest")
            .addQueryItem(name: "count", value: "1000")
            .addQueryItem(name: "client_id", value: "Ahj-66mbyiRNL-GhTltHoIgGfkznNgv7SALhCOTLMaM")
            .build()
        print("The API Request is : " , request)
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
