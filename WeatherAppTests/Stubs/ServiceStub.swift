//
//  ServiceStub.swift
//  WeatherAppTests
//
//  Created by Murtuza Saify on 12/07/2021.
//

import Foundation
@testable import WeatherApp

class ServiceStub: ServiceContractor {

    private var mockMapping: [String : String] = [:]

    func use(mockFile: String, for path: String) {
        mockMapping[path] = mockFile
    }
    
    func get<T>(request: RequestBuildable, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {

        guard let path = request.urlRequest.url?.path,
              let mockFile = mockMapping[path] else {
            return
        }

        let bundle = Bundle(for: ServiceStub.self)
        
        guard let filePath = bundle.path(forResource: mockFile, ofType: "json"),
              let fileData = try? Data(contentsOf: URL(fileURLWithPath: filePath)),
              let result = try? JSONDecoder().decode(T.self, from: fileData) else {
            return
        }
        completion(.success(result))
    }
}
