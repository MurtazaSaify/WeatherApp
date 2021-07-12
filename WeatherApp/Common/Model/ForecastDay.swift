//
//  ForecastDay.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 11/07/2021.
//

import Foundation

struct ForecastDay: Codable {
    var date: String?
    var forecast: Forecast?

    enum CodingKeys: String, CodingKey {
        case date
        case forecast = "day"
    }
}
