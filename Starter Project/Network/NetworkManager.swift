//
//  NetworkManager.swift
//  Starter Project
//
//  Created by Abdallah on 29/03/2023.
//

import UIKit

class NetworkingManager{
    
    static let shared = NetworkingManager()
    private init(){}
    
    public func execute<T : Codable>(request: URLRequest,responseType: T.Type) async throws -> T {
        return try await withCheckedThrowingContinuation{ continuation in
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data , let response = response as? HTTPURLResponse,200 ... 299 ~= response.statusCode else{
                    continuation.resume(throwing: NetworkingError.invalidStatusCode)
                    return
                }
                print(data)
                self.prepareObject(data: data) { continuation.resume(with: $0)}
                return
            }.resume()
        }
    }
    
    fileprivate func prepareObject<T:Codable>(data : Data , completion : @escaping (Result<T,NetworkingError>)->Void){
        do{
            let decoder =  JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(T.self, from: data)
            completion(.success(decodedData))
        }catch{
            print(error.localizedDescription)
            completion(.failure(.failedToDecode))
        }
    }
    
    
}
