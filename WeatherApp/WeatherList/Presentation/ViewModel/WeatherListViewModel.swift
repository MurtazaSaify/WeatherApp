//
//  WeatherListViewModel.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 11/07/2021.
//

import Foundation

class WeatherListViewModel: WeatherListViewModelContractor {

    private let getWeatherListUseCase: FetchWeatherListUseCaseContractor
    private let getPreferredCitiesUseCase: GetPreferredCitiesUseCaseContractor
    private var currentForecastDayList: [ForecastDay]?

    var forecastListDisplayModels: Bind<[ForecastListItemDisplayModel]> = Bind([])
    var prefferedCities: Bind<[String]> = Bind([])

    init(getWeatherListUseCase: FetchWeatherListUseCaseContractor,
         getPreferredCitiesUseCase: GetPreferredCitiesUseCaseContractor) {
        self.getWeatherListUseCase = getWeatherListUseCase
        self.getPreferredCitiesUseCase = getPreferredCitiesUseCase
    }

    func loadPreferredCities() {
        prefferedCities.value = getPreferredCitiesUseCase.getPreferredCities()
    }

    func loadWeatherListFor(city: String, unit: TemperatureUnit) {
        getWeatherListUseCase.fetchWeatherList(city: city) { [weak self] (list, error) in
            
            if let forecastDays = list {
                self?.currentForecastDayList = forecastDays
                let listDisplayModels = forecastDays.compactMap { ForecastListItemDisplayModel(forecastDay: $0,
                                                                                               unit: unit) }
                self?.forecastListDisplayModels.value = listDisplayModels
            }
        }
    }

    func forecastDayObject(index: Int) -> ForecastDay? {
        guard let count = currentForecastDayList?.count,
              index < count else {
            return nil
        }
        return currentForecastDayList?[index]
    }
}
