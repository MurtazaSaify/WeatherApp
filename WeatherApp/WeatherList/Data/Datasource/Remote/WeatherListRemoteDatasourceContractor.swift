//
//  WeatherListRemoteDatasourceContractor.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 11/07/2021.
//

import Foundation

protocol WeatherListRemoteDatasourceContractor {

    func fetchWeatherList(city: String, completion: @escaping (Result<ForecastCollectionWrapper, Error>) -> Void)
}
