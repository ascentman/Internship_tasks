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

final class RootViewController: UIViewController {
    
    @IBOutlet private weak var cityTextField: UITextField!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var weatherDescriptionLabel: UILabel!
    @IBOutlet private weak var pressureLabel: UILabel!
    @IBOutlet private weak var humidityLabel: UILabel!
    @IBOutlet private weak var windSpeedLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTextField.delegate = self
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        let city = cityTextField.text
        if let city = city {
            if city.isEmpty {
                setDefaultTextValues()
            } else {
                let cityWithSpaces = allowSpaces(city)
                getWeatherFromNetwork(cityWithSpaces)
            }
        }
    }
    
    // MARK: - Private
    
    private func getWeatherFromNetwork(_ city: String) {
        Network.shared.getWeather(city) { [weak self] (weather, error) in
            DispatchQueue.main.async {
                if let temperature = weather?.main?.temperature {
                    self?.temperatureLabel.text = String(temperature)
                }
                if let longWeather = weather?.weather?[0].description {
                    self?.weatherDescriptionLabel.text = longWeather
                }
                if let pressure = weather?.main?.pressure {
                    self?.pressureLabel.text = Constants.pressure + String(pressure)
                }
                if let humidity = weather?.main?.humidity {
                    self?.humidityLabel.text = Constants.humidity + String(humidity)
                }
                if let speed = weather?.wind?.speed {
                    self?.windSpeedLabel.text = Constants.windSpeed + String(speed)
                }
            }
        }
    }
    
    private func allowSpaces(_ city: String) -> String {
        return city.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)!
    }
    
    private func setDefaultTextValues() {
        temperatureLabel.text = nil
        weatherDescriptionLabel.text = nil
        pressureLabel.text = nil
        humidityLabel.text = nil
        windSpeedLabel.text = nil
    }
}

// MARK: - Extensions

extension RootViewController: UITextFieldDelegate {
    
    // UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        cityTextField.resignFirstResponder()
        return true
    }
}
