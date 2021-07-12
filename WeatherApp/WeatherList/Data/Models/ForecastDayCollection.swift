//
//  ForecastDayCollection.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 11/07/2021.
//

import Foundation

struct ForecastDayCollection: Codable {
    var forecastDays: [ForecastDay]?

    enum CodingKeys: String, CodingKey {
        case forecastDays = "forecastday"
    }
}
