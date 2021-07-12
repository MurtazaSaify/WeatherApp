//
//  FetchWeatherListUseCaseTests.swift
//  WeatherAppTests
//
//  Created by Murtuza Saify on 12/07/2021.
//

import XCTest
@testable import WeatherApp

class FetchWeatherListUseCaseTests: XCTestCase {

    var useCase: FetchWeatherListUseCase?
    
    var repository: WeatherListRepository?

    var localDatasource: WeatherListLocalDatasource?
    var remoteDatasource: WeatherListRemoteDatasource?
    
    var serviceStub: ServiceStub?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let local = WeatherListLocalDatasource()
        let service = ServiceStub()
        let remote = WeatherListRemoteDatasource(service: service)
        let repository = WeatherListRepository(localDatasource: local,
                                               remoteDatasource: remote)
        
        localDatasource = local
        serviceStub = service
        serviceStub?.use(mockFile: "weather_list_mock", for: "/v1/forecast.json")
        remoteDatasource = remote
        self.repository = repository
        
        useCase = FetchWeatherListUseCase(repository: repository)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUseCaseFetchesDataFromRepository() throws {
        
        let useCaseExpectation = expectation(description: "Use case should fetch results")

        useCase?.fetchWeatherList(city: "city1", completion: { (forecastDays, error) in
            if let result = forecastDays {
                XCTAssertEqual(result.count, 1)
                useCaseExpectation.fulfill()
            } else {
                XCTFail()
            }
        })
        waitForExpectations(timeout: 2, handler: nil)
    }

}
