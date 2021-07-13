//
//  GetForecastDetailsUseCaseContractor.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 13/07/2021.
//

import Foundation

protocol GetForecaseDetailsUseCaseContractor {

    func getForecastDetails(forecastId: Int, completion: (ForecastDay?, Error?) -> ())
}

class GetForecastDetailsUseCase: GetForecaseDetailsUseCaseContractor {

    private let repository: WeatherForecastDetailsRepositoryContractor
    
    init(repository: WeatherForecastDetailsRepositoryContractor) {
        self.repository = repository
    }

    func getForecastDetails(forecastId: Int, completion: (ForecastDay?, Error?) -> ()) {
        repository.getForecastDetailsFor(id: forecastId, completion: completion)
    }
}
