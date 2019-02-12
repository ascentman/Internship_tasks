//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by user on 2/3/19.
//  Copyright © 2019 user. All rights reserved.
//

import Foundation

private enum Constants {
    static let pressure = "Pressure: "
    static let humidity = "Humidity: "
    static let windSpeed = "Wind speed: "
}

class WeatherViewModel {
    
    private var weather = WeatherModel()
    
    var city: Box<String?> = Box(nil)
    var temperature: Box<String?> = Box(nil)
    var pressure: Box<String?> = Box(nil)
    var humidity: Box<String?> = Box(nil)
    var description: Box<String?> = Box(nil)
    var windSpeed: Box<String?> = Box(nil)
    
    init(weather: WeatherModel = WeatherModel()) {
        self.weather = weather
    }
    
    func getWeatherFor(city: String) {
        self.city.value = city
        Network.shared.getWeather(city) { [weak self] (weatherObject, error) in
            DispatchQueue.main.async {
                if let weather = weatherObject {
                    if let temperature = weather.main?.temperature {
                        self?.temperature.value = String(temperature)
                    }
                    if let pressure = weather.main?.pressure {
                        self?.pressure.value = Constants.pressure + String(pressure)
                    }
                    if let humidity = weather.main?.humidity {
                        self?.humidity.value = Constants.humidity + String(humidity)
                    }
                    if let description = weather.weather?.first?.description {
                        self?.description.value = description
                    }
                    if let windSpeed = weather.wind?.speed {
                        self?.windSpeed.value = Constants.windSpeed + String(windSpeed)
                    }
                }
            }
        }
    }
}
