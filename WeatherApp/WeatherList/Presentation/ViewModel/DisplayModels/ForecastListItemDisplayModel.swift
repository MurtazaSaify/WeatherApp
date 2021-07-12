//
//  ForecastListDisplayModel.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 11/07/2021.
//

import Foundation

struct ForecastListItemDisplayModel {

    var maxTemperature: String?
    var minTemperature: String?
    var averageTemperature: String?
    var condition: String?
    var date: String?
    var icon: URL?

    init(forecastDay: ForecastDay,
         unit: TemperatureUnit) {
        
        switch unit {
        case .celcius:
            if let maxTemp = forecastDay.forecast?.maxTempCelcius {
                maxTemperature =  "Max: \(maxTemp) °C"
            }
            if let minTemp = forecastDay.forecast?.minTempCelcius {
                minTemperature =  "Min: \(minTemp) °C"
            }
            if let avgTemp = forecastDay.forecast?.avgTempCelcius {
                averageTemperature =  "Average: \(avgTemp) °C"
            }
        case .farenhite:
            if let maxTemp = forecastDay.forecast?.maxTempFahrenheit {
                maxTemperature =  "Max: \(maxTemp) °F"
            }
            if let minTemp = forecastDay.forecast?.minTempFahrenheit {
                minTemperature =  "Min: \(minTemp) °F"
            }
            if let avgTemp = forecastDay.forecast?.avgTempFahrenheit {
                averageTemperature =  "Average: \(avgTemp) °F"
            }
        }
        
        condition = forecastDay.forecast?.summary?.description
        
        if let iconString = forecastDay.forecast?.summary?.icon?.absoluteString {
            let correctedIconString = iconString.replacingOccurrences(of: "//", with: "https://")
            icon = URL(string: correctedIconString)
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let safeDateString = forecastDay.date,
           let actualDate = dateFormatter.date(from: safeDateString) {
            dateFormatter.dateStyle = .full
            date = dateFormatter.string(from: actualDate)
        }
    }
}
