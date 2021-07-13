//
//  WeatherForecastDetailsLocalDatasourceTests.swift
//  WeatherAppTests
//
//  Created by Murtuza Saify on 13/07/2021.
//

import XCTest
@testable import WeatherApp

class WeatherForecastDetailsLocalDatasourceTests: XCTestCase {

    var datasource: WeatherForecastDetailsLocalDatasource?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        datasource = WeatherForecastDetailsLocalDatasource()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        datasource = nil
    }

    func testDatasourceReturnsDataIfExists() throws {
        datasource?.set(cachedData: ForecastDay(id: 1, date: nil, forecast: nil, hours: nil))
        
        XCTAssertNotNil(datasource?.cachedForecastDetails())
        XCTAssertEqual(datasource?.cachedForecastDetails()?.id, 1)
    }

    func testDatasourceReset() throws {
        datasource?.set(cachedData: ForecastDay(id: 1, date: nil, forecast: nil, hours: nil))
        XCTAssertNotNil(datasource?.cachedForecastDetails())
        
        datasource?.resetCache()
        XCTAssertNil(datasource?.cachedForecastDetails())
    }

}
