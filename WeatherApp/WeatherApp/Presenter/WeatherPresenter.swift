//
//  RootViewController.swift
//  WeatherApp
//
//  Created by user on 11/11/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

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

protocol WeatherPresenterProtocol: class {
    func showWeather(data: RequestModel)
}

final class WeatherPresenter {
    
    private weak var userView: WeatherPresenterProtocol?
    
    func attachView(_ view: WeatherPresenterProtocol) {
        userView = view
    }
    
    func detachView() {
        userView = nil
    }
    
    func loadWeatherFor(city: String) {
        Network.shared.getWeather(city) { [weak self] (weather, error) in
            DispatchQueue.main.async {
                self?.fillRequestModel(data: weather ?? WeatherModel())
            }
        }
    }
    
    private func fillRequestModel(data: WeatherModel) {
        var requestModel = RequestModel()
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
        self.userView?.showWeather(data: requestModel)
    }
}
