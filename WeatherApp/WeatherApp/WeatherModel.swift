//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by user on 11/12/18.
//  Copyright © 2018 user. All rights reserved.
//

import Foundation

final class WeatherModel: Codable {
    let name: String?
    let weather: [Weather]?
    let main: Main?
    let wind: Wind?
}

final class Weather: Codable {
    let main: String?
    let description: String?
    let icon: String?
}

final class Main: Codable {
    let temperature: Float?
    let pressure: Int?
    let humidity: Int?
    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case pressure
        case humidity
    }
}

final class Wind: Codable {
    let speed: Float?
}
