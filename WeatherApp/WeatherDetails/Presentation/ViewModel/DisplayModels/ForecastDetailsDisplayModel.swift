//
//  ForecastDetailsDisplayModel.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 13/07/2021.
//

import Foundation

struct ForecastDetailsDisplayModel {
    var maxTemperature: String?
    var minTemperature: String?
    var averageTemperature: String?
    var condition: String?
    var icon: URL?

    var hourlyDisplayModels: [ForecastHourDisplayModel]

    init(forecastDay: ForecastDay,
         temperatureUnit: TemperatureUnit) {
        switch temperatureUnit {
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
        if let iconUrl = forecastDay.forecast?.summary?.icon {
            icon = URLFormatter.urlByPrefixingHTTPSchemeFor(url: iconUrl)
        }
        
        hourlyDisplayModels = forecastDay.hours?.compactMap { ForecastHourDisplayModel(forecastHour: $0,
                                                                                       temperatureUnit: temperatureUnit) } ?? []
    }
}
