//
//  WeatherForecastDetailsRepository.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 13/07/2021.
//

import Foundation

class WeatherForecastDetailsRepository: WeatherForecastDetailsRepositoryContractor {

    let localDatasource: WeatherForecastDetailsLocalDatasourceContractor

    init(localDatasource: WeatherForecastDetailsLocalDatasourceContractor) {
        self.localDatasource = localDatasource
    }

    func getForecastDetailsFor(id: Int, completion: (ForecastDay?, Error?) -> ()) {

        if let cachedForecast = localDatasource.cachedForecastDetails() {
            completion(cachedForecast, nil)
        } else {
            // TODO: call to remote datasource to fetch forecast details
        }
    }
}
