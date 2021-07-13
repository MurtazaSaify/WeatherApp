//
//  WeatherForecastDetailsViewModelContractor.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 13/07/2021.
//

import Foundation

protocol WeatherForecastDetailsViewModelContractor {

    var forecastDetailsDisplayModel: Bind<ForecastDetailsDisplayModel?> { get }

    func loadForecastDetails()
}
