//
//  FetchWeatherListUseCase.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 11/07/2021.
//

import Foundation

protocol FetchWeatherListUseCaseContractor {

    func fetchWeatherList(city: String, completion: @escaping (([ForecastDay]?, Error?) -> ()))
}

class FetchWeatherListUseCase: FetchWeatherListUseCaseContractor {

    private let repository: WeatherListRepositoryContractor

    init(repository: WeatherListRepositoryContractor) {
        self.repository = repository
    }

    func fetchWeatherList(city: String, completion: @escaping (([ForecastDay]?, Error?) -> ())) {
        repository.fetchWeatherList(city: city, completion: completion)
    }
}
