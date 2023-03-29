//
//  URLRequestBuilder.swift
//  Starter Project
//
//  Created by Abdallah on 29/03/2023.
//

import Foundation


// In this app there is only one get request so the URL Request is get by default

class URLRequestBuilder {

    private var components: URLComponents

    init(route : Route) {
        guard let component = URLComponents(string: route.stringURL) else{
            fatalError("Can't convert string URL to URLComponents")
        }
        self.components = component
    }

    func addQueryItem(name: String, value: String) -> Self  {
        if self.components.queryItems == nil {
            self.components.queryItems = []
        }
        self.components.queryItems?.append(URLQueryItem(name: name, value: value))
        return self
    }

    func build() -> URLRequest {
        return URLRequest(url: self.components.url!)
    }
}

