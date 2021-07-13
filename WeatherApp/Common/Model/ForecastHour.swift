//
//  ForecastHour.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 13/07/2021.
//

import Foundation

struct ForecastHour: Codable {

    var time: String?
    var summary: ForecastSummary?
    var tempCelcius: Double?
    var tempFahrenheit: Double?

    enum CodingKeys: String, CodingKey {
        case time
        case summary = "condition"
        case tempCelcius = "temp_c"
        case tempFahrenheit = "temp_f"
    }
}
