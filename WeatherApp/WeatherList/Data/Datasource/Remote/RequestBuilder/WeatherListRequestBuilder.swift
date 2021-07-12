//
//  WeatherListRequestBuilder.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 11/07/2021.
//

import Foundation

struct WeatherListRequestBuilder: RequestBuildable {

    private let endpoint = "/v1/forecast.json"
    private let city: String

    init(city: String) {
        self.city = city
    }

    private func buildQueryParameters(city: String) -> [URLQueryItem] {
        var queryParameters: [URLQueryItem] = []
        queryParameters.append(URLQueryItem(name: "q", value: city))
        queryParameters.append(URLQueryItem(name: "key", value: Constants.ServiceConstants.apiKey))
        queryParameters.append(URLQueryItem(name: "days", value: "15"))
        return queryParameters
    }
    
    var urlRequest: URLRequest {
        var urlComponent = URLComponents()
        urlComponent.scheme = "http"
        urlComponent.host = "api.weatherapi.com"
        urlComponent.path = endpoint
        urlComponent.queryItems = buildQueryParameters(city: city)
        
        guard let url = urlComponent.url else {
            fatalError("Error building url")
        }
        return URLRequest(url: url)
    }
}
