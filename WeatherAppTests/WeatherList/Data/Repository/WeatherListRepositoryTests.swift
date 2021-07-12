//
//  WeatherListRepositoryTests.swift
//  WeatherAppTests
//
//  Created by Murtuza Saify on 12/07/2021.
//

import XCTest
@testable import WeatherApp

class WeatherListRepositoryTests: XCTestCase {

    var repository: WeatherListRepository?

    var localDatasource: WeatherListLocalDatasource?
    var remoteDatasource: WeatherListRemoteDatasource?
    
    var serviceStub: ServiceStub?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let local = WeatherListLocalDatasource()
        let service = ServiceStub()
        let remote = WeatherListRemoteDatasource(service: service)
        
        localDatasource = local
        serviceStub = service
        remoteDatasource = remote
        
        repository = WeatherListRepository(localDatasource: local,
                                           remoteDatasource: remote)
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRepositoryFetchesDataFromRemoteDatasourceIfLocalDatasourceIsEmpty() throws {
        
        localDatasource?.resetCache()
        serviceStub?.use(mockFile: "weather_list_mock", for: "/v1/forecast.json")
        let networkExpectation = expectation(description: "Repository should use remote datasource to fetch results")
        
        repository?.fetchWeatherList(city: "city", completion: { (forecastDays, error) in
            if let result = forecastDays {
                XCTAssertEqual(result.count, 1)
                networkExpectation.fulfill()
            } else {
                XCTFail()
            }
        })
        waitForExpectations(timeout: 2, handler: nil)
    }

    func testRepositoryFetchesDataFromLocalDatasourceIfDataExistsInLocalDatasource() throws {

        let collection = ForecastDayCollection(forecastDays: [ForecastDay(date: nil, forecast: nil),
                                                              ForecastDay(date: nil, forecast: nil),
                                                              ForecastDay(date: nil, forecast: nil)])
        localDatasource?.set(weatherListData: collection, city: "city1")
        
        let networkExpectation = expectation(description: "Repository should use remote datasource to fetch results")
        
        repository?.fetchWeatherList(city: "city1", completion: { (forecastDays, error) in
            if let result = forecastDays {
                XCTAssertEqual(result.count, collection.forecastDays?.count)
                networkExpectation.fulfill()
            } else {
                XCTFail()
            }
        })
        waitForExpectations(timeout: 2, handler: nil)
    }
}
