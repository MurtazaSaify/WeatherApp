//
//  GetForecastDetailsUseCaseTests.swift
//  WeatherAppTests
//
//  Created by Murtuza Saify on 13/07/2021.
//

import XCTest
@testable import WeatherApp

class GetForecastDetailsUseCaseTests: XCTestCase {

    var useCase: GetForecastDetailsUseCase?

    var datasource: WeatherForecastDetailsLocalDatasource?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let lDatasource = WeatherForecastDetailsLocalDatasource()
        let repository = WeatherForecastDetailsRepository(localDatasource: lDatasource)
        useCase = GetForecastDetailsUseCase(repository: repository)
        datasource = lDatasource
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        useCase = nil
        datasource = nil
    }

    func testUseCaseRetrievesDataFromRepository() throws {
        
        datasource?.set(cachedData: ForecastDay(id: 1,
                                                date: nil,
                                                forecast: nil,
                                                hours: nil))
        
        let testExpectation = expectation(description: "Use case should use repository to fetch results")
        
        useCase?.getForecastDetails(forecastId: 1) { (forecast, error) in
            if forecast != nil {
                testExpectation.fulfill()
            } else {
                XCTFail()
            }
        }
        waitForExpectations(timeout: 2, handler: nil)
    }

}
