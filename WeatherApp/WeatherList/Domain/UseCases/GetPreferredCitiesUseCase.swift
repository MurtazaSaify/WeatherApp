//
//  GetPreferredCitiesUseCase.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 11/07/2021.
//

import Foundation

protocol GetPreferredCitiesUseCaseContractor {
    func getPreferredCities() -> [String]
}

class GetPreferredCitiesUseCase: GetPreferredCitiesUseCaseContractor {

    func getPreferredCities() -> [String] {

        // Below cities should ideally be returned from a call to usecase -> repository -> datasource,
        // but returning it directly from here just to be faster for test.
        
        return ["Dubai", "Abu Dhabi", "Paris"]
    }
}
