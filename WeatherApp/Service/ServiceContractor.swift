//
//  ServiceContractor.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 11/07/2021.
//

import Foundation

protocol RequestBuildable {
    var urlRequest: URLRequest { get }
}

protocol ServiceContractor {

    func get<T: Codable>(request: RequestBuildable, completion: @escaping (Result<T, Error>) -> Void)
}
