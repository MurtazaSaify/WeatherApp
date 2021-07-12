//
//  WeatherListRemoteDatasourceTests.swift
//  WeatherAppTests
//
//  Created by Murtuza Saify on 12/07/2021.
//

import XCTest
@testable import WeatherApp

class WeatherListRemoteDatasourceTests: XCTestCase {

    var remoteDatasource: WeatherListRemoteDatasource?
    var serviceStub: ServiceStub?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let service = ServiceStub()
        serviceStub = service
        remoteDatasource = WeatherListRemoteDatasource(service: service)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        serviceStub = nil
        remoteDatasource = nil
    }

    func testRemoteRepositoryFetchesDataFromService() throws {
        
        serviceStub?.use(mockFile: "weather_list_mock", for: "/v1/forecast.json")
        let networkExpectation = expectation(description: "Remote datasource should be able to fetch results")
        
        remoteDatasource?.fetchWeatherList(city: "city1", completion: { (result) in
            switch result {
            case .success:
                networkExpectation.fulfill()
            case .failure:
                XCTFail()
            }
        })
        waitForExpectations(timeout: 2, handler: nil)
    }
}
