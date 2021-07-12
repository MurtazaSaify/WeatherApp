//
//  WeatherListViewModelContractor.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 11/07/2021.
//

import Foundation

protocol WeatherListViewModelContractor {

    var forecastListDisplayModels: Bind<[ForecastListItemDisplayModel]> { get }
    var prefferedCities: Bind<[String]> { get }
    
    func loadWeatherListFor(city: String, unit: TemperatureUnit)
    func loadPreferredCities()
}
