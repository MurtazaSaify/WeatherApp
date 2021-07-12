//
//  WeatherListLocalDatasourceTests.swift
//  WeatherAppTests
//
//  Created by Murtuza Saify on 12/07/2021.
//

import XCTest
@testable import WeatherApp

class WeatherListLocalDatasourceTests: XCTestCase {

    var localDatasource: WeatherListLocalDatasource?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        localDatasource = WeatherListLocalDatasource()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        localDatasource = nil
    }

    func testSetAndRetrieveDataFromLocalDatasource() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let collection = ForecastDayCollection(forecastDays: [ForecastDay(date: nil, forecast: nil),
                                                              ForecastDay(date: nil, forecast: nil),
                                                              ForecastDay(date: nil, forecast: nil)])
        localDatasource?.set(weatherListData: collection, city: "city1")
        XCTAssertEqual(localDatasource?.getCachedWeatherListData(city: "city1")?.forecastDays?.count, collection.forecastDays?.count)
    }

    func testSetAndRetrieveDataFromLocalDatasourceForMultipleCities() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let collection = ForecastDayCollection(forecastDays: [ForecastDay(date: nil, forecast: nil),
                                                              ForecastDay(date: nil, forecast: nil),
                                                              ForecastDay(date: nil, forecast: nil)])
        localDatasource?.set(weatherListData: collection, city: "city1")
        
        let collection2 = ForecastDayCollection(forecastDays: [ForecastDay(date: nil, forecast: nil),
                                                              ForecastDay(date: nil, forecast: nil)])
        localDatasource?.set(weatherListData: collection2, city: "city2")
        
        
        let collection3 = ForecastDayCollection(forecastDays: [ForecastDay(date: nil, forecast: nil)])
        localDatasource?.set(weatherListData: collection3, city: "city3")
        
        XCTAssertEqual(localDatasource?.getCachedWeatherListData(city: "city1")?.forecastDays?.count, collection.forecastDays?.count)
        XCTAssertEqual(localDatasource?.getCachedWeatherListData(city: "city2")?.forecastDays?.count, collection2.forecastDays?.count)
        XCTAssertEqual(localDatasource?.getCachedWeatherListData(city: "city3")?.forecastDays?.count, collection3.forecastDays?.count)
    }

    func testResetData() throws {

        let collection = ForecastDayCollection(forecastDays: [ForecastDay(date: nil, forecast: nil),
                                                              ForecastDay(date: nil, forecast: nil),
                                                              ForecastDay(date: nil, forecast: nil)])
        localDatasource?.set(weatherListData: collection, city: "city1")
        XCTAssertEqual(localDatasource?.getCachedWeatherListData(city: "city1")?.forecastDays?.count, collection.forecastDays?.count)
        
        localDatasource?.resetCache()
        XCTAssertNil(localDatasource?.getCachedWeatherListData(city: "city1"))
    }

}
