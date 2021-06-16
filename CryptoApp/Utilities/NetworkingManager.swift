//
//  NetworkingManager.swift
//  CryptoApp
//
//  Created by Simec Sys Ltd. on 16/6/21.
//

import Foundation
import Combine

class NetworkingManager {
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var description: String? {
            switch self {
            case .badURLResponse(url: let url): return "[🔥] bad response from URL: \(url)"
            case .unknown: return "[⚠️] unknown error occured"
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { try handleURLResponse(output: $0, url: url)}
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print("Error with localized description: \(error.localizedDescription)")
        }
    }
}
