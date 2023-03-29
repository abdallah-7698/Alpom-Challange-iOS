//
//  NetworkingError.swift
//  Starter Project
//
//  Created by Abdallah on 29/03/2023.
//

import Foundation

public protocol CustomError: LocalizedError {}

public enum NetworkingError {
    case requestFailed(reason: Error)
    case invalidStatusCode
    case failedToDecode
}

extension NetworkingError: CustomError {
  
    public var errorDescription: String? {
        switch self {
        case .requestFailed:
            return "Error Occurred"
        case .invalidStatusCode:
            return "Request failed"
        case .failedToDecode:
            return "Failed to decode"
        }
    }
    
    public var failureReason: String? {
        switch self {
        case .requestFailed(let reason):
            return reason.localizedDescription
        case .invalidStatusCode:
            return "Request didn't fall into the 200 status code"
        case .failedToDecode:
            return "Response failed to decode due to mismatch"
        }
    }
    
}
