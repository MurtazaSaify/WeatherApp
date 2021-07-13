//
//  WeatherForecastDetailsStackBuilder.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 13/07/2021.
//

import Foundation
import UIKit

class WeatherForecastDetailsStackBuilder {

    static func buildWith(forecastday: ForecastDay,
                          temperatureUnit: TemperatureUnit) -> WeatherForecastDetailsViewController {

        let localDatasource = WeatherForecastDetailsLocalDatasource()
        localDatasource.set(cachedData: forecastday)
        
        let repository = WeatherForecastDetailsRepository(localDatasource: localDatasource)
        
        let useCase = GetForecastDetailsUseCase(repository: repository)
        let viewModel = WeatherForecastDetailsViewModel(forecastId: forecastday.id ?? 0,
                                                        temperatureUnit: temperatureUnit,
                                                        getForecastDetailsUseCase: useCase)
    
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "WeatherForecastDetailsViewController") as? WeatherForecastDetailsViewController else {
            fatalError("Expected instance of WeatherForecastDetailsViewController")
        }
        viewController.viewModel = viewModel
        return viewController
    }
}
