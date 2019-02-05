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
    
    private var requestModel: WeatherModel!
    var temperature: Float = 0.0
    var weatherDescription = ""
    var pressure = 0
    var humidity = 0
    var windSpeed: Float = 0.0
    var city: String = "Lviv" {
        didSet {
//            getWeatherFromNetwork(city)
        }
    }
    
    init() {
        Network.shared.getWeather("Lviv") { [weak self] (weather, error) in
            DispatchQueue.main.async {
                if let temperature = weather?.main?.temperature {
                    self?.temperature = temperature
                }
                if let longWeather = weather?.weather?[0].description {
                    self?.weatherDescription = longWeather
                }
                if let pressure = weather?.main?.pressure {
                    self?.pressure = pressure
                }
                if let humidity = weather?.main?.humidity {
                    self?.humidity = humidity
                }
                if let speed = weather?.wind?.speed {
                    self?.windSpeed = speed
                }
            }
        }
    }
    
    func configure(_ view: WeatherView) {
        view.temperatureLabel.text = String(temperature)
        view.weatherDescriptionLabel.text = weatherDescription
        view.humidityLabel.text = Constants.humidity + String(humidity)
        view.pressureLabel.text = Constants.pressure + String(pressure)
        view.windSpeedLabel.text = Constants.windSpeed + String(windSpeed)
    }
}
