//
//  RootViewController.swift
//  WeatherApp
//
//  Created by user on 11/11/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
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
        Network.shared.getWeather(city) { (weather, error) in
            DispatchQueue.main.async {
                if let temperature = weather?.main?.temperature {
                    self.temperatureLabel.text = String(temperature)
                }
                if let longWeather = weather?.weather?[0].description {
                    self.weatherDescriptionLabel.text = longWeather
                }
                if let pressure = weather?.main?.pressure {
                    self.pressureLabel.text = "Pressure: " + String(pressure)
                }
                if let humidity = weather?.main?.humidity {
                    self.humidityLabel.text = "Humidity: " + String(humidity)
                }
                if let speed = weather?.wind?.speed {
                    self.windSpeedLabel.text = "Wind speed: " + String(speed)
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
