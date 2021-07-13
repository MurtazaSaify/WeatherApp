//
//  WeatherForecastDetailsRepositoryContractor.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 13/07/2021.
//

import Foundation

protocol WeatherForecastDetailsRepositoryContractor {

    func getForecastDetailsFor(id: Int, completion: (ForecastDay?, Error?) -> ())
}
