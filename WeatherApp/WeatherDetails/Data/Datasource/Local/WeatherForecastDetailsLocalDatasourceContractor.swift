//
//  WeatherForecastDetailsLocalDatasourceContractor.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 13/07/2021.
//

import Foundation

protocol WeatherForecastDetailsLocalDatasourceContractor {

    func cachedForecastDetails() -> ForecastDay?
    func set(cachedData: ForecastDay)
    func resetCache()
}
