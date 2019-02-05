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

struct RequestModel {
    var temperature: String
    var weatherDescription: String
    var pressure: String
    var humidity: String
    var windSpeed: String
    
    init() {
        self.temperature = ""
        self.weatherDescription = ""
        self.pressure = ""
        self.humidity = ""
        self.windSpeed = ""
    }
}

class WeatherViewModel {
    
    private var requestModel = RequestModel()
    
    typealias propertyChanged = ((_ city: String) -> ())?
    private var cityResponse: propertyChanged
    
    var city: String = "" {
        didSet {
            
        }
    }
    
    func getWeatherForCity(completion: propertyChanged) {
        cityResponse = completion
    }
    
    private func fillRequestModel(data: WeatherModel) {
        if let temperature = data.main?.temperature {
            requestModel.temperature = String(temperature)
        }
        if let longWeather = data.weather?[0].description {
            requestModel.weatherDescription = longWeather
        }
        if let pressure = data.main?.pressure {
            requestModel.pressure = Constants.pressure + String(pressure)
        }
        if let humidity = data.main?.humidity {
            requestModel.humidity = Constants.humidity + String(humidity)
        }
        if let speed = data.wind?.speed {
            requestModel.windSpeed = Constants.windSpeed + String(speed)
        }
    }
    
    func configure(_ view: WeatherView) {
        view.temperatureLabel.text = requestModel.temperature
        view.weatherDescriptionLabel.text = requestModel.weatherDescription
        view.humidityLabel.text = requestModel.humidity
        view.pressureLabel.text = requestModel.pressure
        view.windSpeedLabel.text = requestModel.windSpeed
    }
}
