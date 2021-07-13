//
//  WeatherForecastDetailsRepositoryTests.swift
//  WeatherAppTests
//
//  Created by Murtuza Saify on 13/07/2021.
//

import XCTest
@testable import WeatherApp

class WeatherForecastDetailsRepositoryTests: XCTestCase {

    var repository: WeatherForecastDetailsRepository?
    var datasource: WeatherForecastDetailsLocalDatasource?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let localDatasource = WeatherForecastDetailsLocalDatasource()
        repository = WeatherForecastDetailsRepository(localDatasource: localDatasource)
        datasource = localDatasource
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRepositoryRetrievesDataFromDatasource() throws {
        datasource?.set(cachedData: ForecastDay(id: 1,
                                                date: nil,
                                                forecast: nil,
                                                hours: nil))
        
        let testExpectation = expectation(description: "Repository should use datasource to fetch results")
        
        repository?.getForecastDetailsFor(id: 1, completion: { (forecast, error) in
            if forecast != nil {
                testExpectation.fulfill()
            } else {
                XCTFail()
            }
        })
        waitForExpectations(timeout: 2, handler: nil)
    }

}
