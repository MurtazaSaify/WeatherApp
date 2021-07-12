//
//  WeatherListRepository.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 11/07/2021.
//

import Foundation

class WeatherListRepository: WeatherListRepositoryContractor {

    private let localDatasource: WeatherListLocalDatasourceContractor
    private let remoteDatasource: WeatherListRemoteDatasourceContractor

    init(localDatasource: WeatherListLocalDatasourceContractor,
         remoteDatasource: WeatherListRemoteDatasourceContractor) {
        self.localDatasource = localDatasource
        self.remoteDatasource = remoteDatasource
    }
    
    func fetchWeatherList(city: String, completion: @escaping (([ForecastDay]?, Error?) -> ())) {
        if let collection = localDatasource.getCachedWeatherListData(city: city) {
            completion(collection.forecastDays, nil)
        } else {
            remoteDatasource.fetchWeatherList(city: city) { [weak self] (result) in
                switch result {
                case let .success(collection):
                    self?.localDatasource.set(weatherListData: collection.collection, city: city)
                    completion(collection.collection?.forecastDays, nil)
                case let .failure(error):
                    completion(nil, error)
                }
            }
        }
    }
}
