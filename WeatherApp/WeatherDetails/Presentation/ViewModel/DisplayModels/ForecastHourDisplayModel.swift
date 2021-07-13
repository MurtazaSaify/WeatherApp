//
//  ForecastHourDisplayModel.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 13/07/2021.
//

import Foundation

struct ForecastHourDisplayModel {
    var condition: String?
    var time: String?
    var icon: URL?
    var temperatureText: String?

    init(forecastHour: ForecastHour,
         temperatureUnit: TemperatureUnit) {
        
        if let iconUrl = forecastHour.summary?.icon {
            icon = URLFormatter.urlByPrefixingHTTPSchemeFor(url: iconUrl)
        }
        time = forecastHour.time?.components(separatedBy: " ").last
        condition = forecastHour.summary?.description
        
        switch temperatureUnit {
        case .celcius:
            if let temperature = forecastHour.tempCelcius {
                temperatureText = "Temperature: \(temperature) °C"
            }
        case .farenhite:
            if let temperature = forecastHour.tempFahrenheit {
                temperatureText = "Temperature: \(temperature) °F"
            }
        }
        
    }
}
