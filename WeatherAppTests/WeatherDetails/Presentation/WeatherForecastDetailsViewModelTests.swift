//
//  WeatherForecastDetailsViewModelTests.swift
//  WeatherAppTests
//
//  Created by Murtuza Saify on 13/07/2021.
//

import XCTest
@testable import WeatherApp

class WeatherForecastDetailsViewModelTests: XCTestCase {

    var viewModel: WeatherForecastDetailsViewModel?

    var datasource: WeatherForecastDetailsLocalDatasource?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let lDatasource = WeatherForecastDetailsLocalDatasource()
        let repository = WeatherForecastDetailsRepository(localDatasource: lDatasource)
        let useCase = GetForecastDetailsUseCase(repository: repository)
        
        viewModel = WeatherForecastDetailsViewModel(forecastId: 1,
                                                    temperatureUnit: .celcius,
                                                    getForecastDetailsUseCase: useCase)
        datasource = lDatasource
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadWeatherForecastDetailsCall() throws {
        
        datasource?.set(cachedData: ForecastDay(id: 1,
                                                date: nil,
                                                forecast: nil,
                                                hours: nil))
        let testExpectation = expectation(description: "ViewModel should load weather details")
        
        viewModel?.forecastDetailsDisplayModel.bind(listener: { (displayModel) in
            if displayModel != nil {
                testExpectation.fulfill()
            }
        })
        
        viewModel?.loadForecastDetails()
        waitForExpectations(timeout: 2, handler: nil)
    }

}
