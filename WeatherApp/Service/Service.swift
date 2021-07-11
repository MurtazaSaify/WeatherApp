//
//  Service.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 11/07/2021.
//

import Foundation

class Service: ServiceContractor {

    private var urlSession: URLSession

    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    func get<T>(request: RequestBuildable, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {

        let urlRequest = request.urlRequest
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(result))
                    }
                } catch let e {
                    DispatchQueue.main.async {
                        completion(.failure(e))
                    }
                }
            } else if let serviceError = error {
                DispatchQueue.main.async {
                    completion(.failure(serviceError))
                }
            }
        }.resume()
    }
}
