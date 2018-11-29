//
//  RootViewController.swift
//  WeatherApp
//
//  Created by user on 11/11/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

final class WeatherPresenter {
    
    private weak var weatherView: WeatherView?
    private var model: WeatherModel? // need to create it somewhere
    init() {}
    
    func attachView(view: WeatherView) {
        weatherView = view
    }
    
    func detachView() {
        weatherView = nil
    }
    
    func loadWeatherForCity(_ city: String) {
        Network.shared.getWeather(city) { (weather, error) in
            DispatchQueue.main.async {
                self.model = weather
            }
        }
        self.weatherView?.showWeather(self.model ?? WeatherModel())
    }
}
