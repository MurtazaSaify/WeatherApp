//
//  WeatherListRemoteDatasource.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 11/07/2021.
//

import Foundation

class WeatherListRemoteDatasource: WeatherListRemoteDatasourceContractor {

    private let service: ServiceContractor

    init(service: ServiceContractor) {
        self.service = service
    }

    func fetchWeatherList(city: String, completion: @escaping (Result<ForecastCollectionWrapper, Error>) -> Void) {
        let requestBuilder = WeatherListRequestBuilder(city: city)
        service.get(request: requestBuilder, completion: completion)
    }
}
