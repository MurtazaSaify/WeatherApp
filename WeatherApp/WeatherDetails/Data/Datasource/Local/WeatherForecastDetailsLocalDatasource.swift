//
//  WeatherForecastDetailsLocalDatasource.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 13/07/2021.
//

import Foundation

class WeatherForecastDetailsLocalDatasource: WeatherForecastDetailsLocalDatasourceContractor {

    private var forecastDay: ForecastDay?
    
    func cachedForecastDetails() -> ForecastDay? {
        return forecastDay
    }
    
    func set(cachedData: ForecastDay) {
        forecastDay = cachedData
    }
    
    func resetCache() {
        forecastDay = nil
    }
}
