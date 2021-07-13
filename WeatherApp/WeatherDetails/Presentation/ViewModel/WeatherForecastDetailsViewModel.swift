//
//  WeatherForecastDetailsViewModel.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 13/07/2021.
//

import Foundation

class WeatherForecastDetailsViewModel: WeatherForecastDetailsViewModelContractor {

    private let forecastId: Int
    private let temperatureUnit: TemperatureUnit
    private let getForecastDetailsUseCase: GetForecaseDetailsUseCaseContractor
    
    var forecastDetailsDisplayModel: Bind<ForecastDetailsDisplayModel?> = Bind(nil)

    init(forecastId: Int,
         temperatureUnit: TemperatureUnit,
         getForecastDetailsUseCase: GetForecaseDetailsUseCaseContractor) {
        self.forecastId = forecastId
        self.temperatureUnit = temperatureUnit
        self.getForecastDetailsUseCase = getForecastDetailsUseCase
    }
    
    func loadForecastDetails() {
        getForecastDetailsUseCase.getForecastDetails(forecastId: forecastId) { [weak self] (forecast, error) in
            if let result = forecast {
                let displayModel = ForecastDetailsDisplayModel(forecastDay: result,
                                                           temperatureUnit: temperatureUnit)
                self?.forecastDetailsDisplayModel.value = displayModel
            } else {
                //TODO: Handle error
            }
            
        }
    }
}
