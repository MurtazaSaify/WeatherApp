//
//  ForecastListItemDisplayModelTests.swift
//  WeatherAppTests
//
//  Created by Murtuza Saify on 12/07/2021.
//

import XCTest
@testable import WeatherApp

class ForecastListItemDisplayModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testForecastItemDisplayModelForTempUnitAsCelcius() throws {
        
        let dataModel = ForecastDay(date: "2021-07-21",
                                    forecast: Forecast(maxTempCelcius: 35,
                                                       minTempCelcius: 31,
                                                       avgTempCelcius: 33,
                                                       maxTempFahrenheit: 96,
                                                       minTempFahrenheit: 91,
                                                       avgTempFahrenheit: 93,
                                                       summary: nil))
        
        let displayModel = ForecastListItemDisplayModel(forecastDay: dataModel, unit: .celcius)
        XCTAssertEqual(displayModel.maxTemperature, "Max: \(dataModel.forecast?.maxTempCelcius ?? 0) °C")
        XCTAssertEqual(displayModel.minTemperature, "Min: \(dataModel.forecast?.minTempCelcius ?? 0) °C")
        XCTAssertEqual(displayModel.averageTemperature, "Average: \(dataModel.forecast?.avgTempCelcius ?? 0) °C")
    }

    func testForecastItemDisplayModelForTempUnitAsFarehnite() throws {
        
        let dataModel = ForecastDay(date: "2021-07-21",
                                    forecast: Forecast(maxTempCelcius: 35,
                                                       minTempCelcius: 31,
                                                       avgTempCelcius: 33,
                                                       maxTempFahrenheit: 96,
                                                       minTempFahrenheit: 91,
                                                       avgTempFahrenheit: 93,
                                                       summary: nil))
        
        let displayModel = ForecastListItemDisplayModel(forecastDay: dataModel, unit: .farenhite)
        XCTAssertEqual(displayModel.maxTemperature, "Max: \(dataModel.forecast?.maxTempFahrenheit ?? 0) °F")
        XCTAssertEqual(displayModel.minTemperature, "Min: \(dataModel.forecast?.minTempFahrenheit ?? 0) °F")
        XCTAssertEqual(displayModel.averageTemperature, "Average: \(dataModel.forecast?.avgTempFahrenheit ?? 0) °F")
    }

}
