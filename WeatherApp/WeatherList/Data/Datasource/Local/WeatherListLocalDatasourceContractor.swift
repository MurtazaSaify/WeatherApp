//
//  WeatherListLocalDatasourceContractor.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 11/07/2021.
//

import Foundation

protocol WeatherListLocalDatasourceContractor {

    func getCachedWeatherListData(city: String) -> ForecastDayCollection?
    func set(weatherListData: ForecastDayCollection?, city: String)
    func resetCache()
}
