//
//  WeatherListLocalDatasource.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 11/07/2021.
//

import Foundation

class WeatherListLocalDatasource: WeatherListLocalDatasourceContractor {

    private var cachedData: [String : ForecastDayCollection?]?

    init() {
        cachedData = [:]
    }

    func getCachedWeatherListData(city: String) -> ForecastDayCollection? {
        guard let collection = cachedData?[city] else {
            return nil
        }
        return collection
    }

    func set(weatherListData: ForecastDayCollection?, city: String) {
        self.cachedData?[city] = weatherListData
    }

    func resetCache() {
        self.cachedData = nil
    }
}
