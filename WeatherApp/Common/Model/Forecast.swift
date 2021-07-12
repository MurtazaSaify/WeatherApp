//
//  WeatherForecast.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 11/07/2021.
//

import Foundation

struct ForecastSummary: Codable {
    var description: String?
    var icon: URL?

    enum CodingKeys: String, CodingKey {
        case description = "text"
        case icon
    }
}

struct Forecast: Codable {
    var maxTempCelcius: Double?
    var minTempCelcius: Double?
    var avgTempCelcius: Double?
    var maxTempFahrenheit: Double?
    var minTempFahrenheit: Double?
    var avgTempFahrenheit: Double?
    var summary: ForecastSummary?

    enum CodingKeys: String, CodingKey {
        case maxTempCelcius = "maxtemp_c"
        case minTempCelcius = "mintemp_c"
        case avgTempCelcius = "avgtemp_c"
        case maxTempFahrenheit = "maxtemp_f"
        case minTempFahrenheit = "mintemp_f"
        case avgTempFahrenheit = "avgtemp_f"
        case summary = "condition"
    }
}
