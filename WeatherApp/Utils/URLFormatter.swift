//
//  URLFormatter.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 13/07/2021.
//

import Foundation

class URLFormatter {

    static func urlByPrefixingHTTPSchemeFor(url: URL) -> URL? {
        var urlComponent = URLComponents(string: url.absoluteString)
        urlComponent?.scheme = "http"
        return urlComponent?.url
    }
}
