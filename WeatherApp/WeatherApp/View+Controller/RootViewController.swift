//
//  RootViewController.swift
//  WeatherApp
//
//  Created by user on 11/11/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

final class RootViewController: UIViewController {
    
    @IBOutlet weak var weatherView: WeatherView!
    @IBOutlet weak var cityTextField: UITextField!
    var weatherViewModel = WeatherViewModel()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherViewModel.configure(weatherView)
        cityTextField.delegate = self
    }
//
    @IBAction func buttonClicked(_ sender: Any) {
        
//        let city = cityTextField.text
//        if let city = city {
//            if city.isEmpty {
//                setDefaultTextValues()
//            } else {
//                let cityWithSpaces = allowSpaces(city)
//                getWeatherFromNetwork(cityWithSpaces)
//            }
//        }
    }
//
//    // MARK: - Private
//
//    private func getWeatherFromNetwork(_ city: String) {
//        Network.shared.getWeather(city) { [weak self] (weather, error) in
//            DispatchQueue.main.async {
//                if let temperature = weather?.main?.temperature {
//                    self?.temperatureLabel.text = String(temperature)
//                }
//                if let longWeather = weather?.weather?[0].description {
//                    self?.weatherDescriptionLabel.text = longWeather
//                }
//                if let pressure = weather?.main?.pressure {
//                    self?.pressureLabel.text = Constants.pressure + String(pressure)
//                }
//                if let humidity = weather?.main?.humidity {
//                    self?.humidityLabel.text = Constants.humidity + String(humidity)
//                }
//                if let speed = weather?.wind?.speed {
//                    self?.windSpeedLabel.text = Constants.windSpeed + String(speed)
//                }
//            }
//        }
//    }
//
//    private func allowSpaces(_ city: String) -> String {
//        return city.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)!
//    }
//
//    private func setDefaultTextValues() {
//        temperatureLabel.text = nil
//        weatherDescriptionLabel.text = nil
//        pressureLabel.text = nil
//        humidityLabel.text = nil
//        windSpeedLabel.text = nil
//    }
}

// MARK: - Extensions

extension RootViewController: UITextFieldDelegate {

    // UITextFieldDelegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        cityTextField.resignFirstResponder()
        return true
    }
}
