//
//  ForecastDay.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 11/07/2021.
//

import Foundation

struct ForecastDay: Codable {
    var id: Int?
    var date: String?
    var forecast: Forecast?
    var hours: [ForecastHour]?

    enum CodingKeys: String, CodingKey {
        case id = "date_epoch"
        case date
        case forecast = "day"
        case hours = "hour"
    }
}
