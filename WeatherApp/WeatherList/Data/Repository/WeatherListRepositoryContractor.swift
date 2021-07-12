//
//  WeatherListRepositoryContractor.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 11/07/2021.
//

import Foundation

protocol WeatherListRepositoryContractor {

    func fetchWeatherList(city: String, completion: @escaping (([ForecastDay]?, Error?) -> ()))
}
