//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by user on 11/12/18.
//  Copyright © 2018 user. All rights reserved.
//

import Foundation

final class WeatherModel: Codable {
    var name: String?
    var weather: [Weather]?
    var main: Main?
    var wind: Wind?
    
    init() {
        self.name = ""
        self.weather = [Weather()]
        self.main?.humidity = 0
        self.main?.pressure = 0
        self.main?.temperature = 0.0
        self.wind = Wind()
    }
}

final class Weather: Codable {
    var description: String?
    var icon: String?
    
    init() {
        self.description = ""
        self.icon = ""
    }
}

final class Main: Codable {
    var temperature: Float?
    var pressure: Int?
    var humidity: Int?
    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case pressure
        case humidity
    }
}

final class Wind: Codable {
    var speed: Float?
    
    init() {
        self.speed = 0.0
    }
}
