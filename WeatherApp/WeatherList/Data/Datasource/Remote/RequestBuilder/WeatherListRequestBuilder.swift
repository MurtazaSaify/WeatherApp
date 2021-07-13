//
//  WeatherListRequestBuilder.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 11/07/2021.
//

import Foundation

struct WeatherListRequestBuilder: RequestBuildable {

    private struct RequestBuilderConstants {
        static let defaultDaysCount = 3
        static let endpoint = "/v1/forecast.json"
    }

    private let city: String
    private let daysCount: Int

    init(city: String,
         daysCount: Int = RequestBuilderConstants.defaultDaysCount) {
        self.city = city
        self.daysCount = daysCount
    }

    private func buildQueryParameters(city: String) -> [URLQueryItem] {
        var queryParameters: [URLQueryItem] = []
        queryParameters.append(URLQueryItem(name: "q", value: city))
        queryParameters.append(URLQueryItem(name: "key", value: Constants.ServiceConstants.apiKey))
        queryParameters.append(URLQueryItem(name: "days", value: "\(daysCount)"))
        return queryParameters
    }
    
    var urlRequest: URLRequest {
        var urlComponent = baseURLComponents()
        urlComponent.path = RequestBuilderConstants.endpoint
        urlComponent.queryItems = buildQueryParameters(city: city)
        
        guard let url = urlComponent.url else {
            fatalError("Error building url")
        }
        return URLRequest(url: url)
    }
}
