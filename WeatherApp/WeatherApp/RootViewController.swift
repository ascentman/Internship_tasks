//
//  RootViewController.swift
//  WeatherApp
//
//  Created by user on 11/11/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeatherFromNetwork()
    }
    
    // MARK: - Private
    
    private func getWeatherFromNetwork() {
        Network.shared.getWeather("London") { (weather, error) in
            print(
                weather?.name,
                weather?.weather?[0].main,
                weather?.weather?[0].description,
                weather?.weather?[0].icon,
                weather?.main?.temperature,
                weather?.main?.pressure,
                weather?.main?.humidity,
                weather?.wind?.speed
            )
        }
    }
}

