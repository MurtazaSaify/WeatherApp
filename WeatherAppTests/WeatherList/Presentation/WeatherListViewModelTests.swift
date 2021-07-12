//
//  WeatherListViewModelTests.swift
//  WeatherAppTests
//
//  Created by Murtuza Saify on 12/07/2021.
//

import XCTest
@testable import WeatherApp

class WeatherListViewModelTests: XCTestCase {

    var viewModel: WeatherListViewModel?
    
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
        let useCase = FetchWeatherListUseCase(repository: repository)
        
        localDatasource = local
        serviceStub = service
        serviceStub?.use(mockFile: "weather_list_mock", for: "/v1/forecast.json")
        remoteDatasource = remote
        self.repository = repository
        self.useCase = useCase
        
        viewModel = WeatherListViewModel(getWeatherListUseCase: useCase,
                                         getPreferredCitiesUseCase: GetPreferredCitiesUseCase())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewModelGetsDataForWeatherListViaUseCase() throws {

        let viewModelExpectation = expectation(description: "Use case should fetch results")

        viewModel?.forecastListDisplayModels.bind(listener: { (displayEntities) in
            if displayEntities.count > 0 {
                viewModelExpectation.fulfill()
            }
        })
        viewModel?.loadWeatherListFor(city: "city1", unit: .celcius)

        waitForExpectations(timeout: 2, handler: nil)
    }

}
