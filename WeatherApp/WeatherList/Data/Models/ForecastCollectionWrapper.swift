//
//  ForecastCollectionWrapper.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 11/07/2021.
//

import Foundation

struct ForecastCollectionWrapper: Codable {
    var collection: ForecastDayCollection?

    enum CodingKeys: String, CodingKey {
        case collection = "forecast"
    }
}
