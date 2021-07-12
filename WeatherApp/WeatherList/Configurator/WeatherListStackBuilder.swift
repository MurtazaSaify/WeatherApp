//
//  WeatherListStackBuilder.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 11/07/2021.
//

import Foundation
import UIKit

class WeatherListStackBuilder {

    static func configureFor(viewController: WeatherListViewController) {

        let remoteDatasource = WeatherListRemoteDatasource(service: Service())
        let localDatasource = WeatherListLocalDatasource()
        let repository = WeatherListRepository(localDatasource: localDatasource,
                                               remoteDatasource: remoteDatasource)
        
        let useCase = FetchWeatherListUseCase(repository: repository)
        let viewModel = WeatherListViewModel(getWeatherListUseCase: useCase,
                                             getPreferredCitiesUseCase: GetPreferredCitiesUseCase())
        
        viewController.viewModel = viewModel
    }
}
