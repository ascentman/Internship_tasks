//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Vova on 11/29/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

private enum Constants {
    static let pressure = "Pressure: "
    static let humidity = "Humidity: "
    static let windSpeed = "Wind speed: "
}

protocol WeatherView: class {
    func showWeather(_ data: WeatherModel)
    func setDefaultTextValues()
}

final class WeatherViewController: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    private var presenter = WeatherPresenter()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
        // create model
        cityTextField.delegate = self
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        let city = cityTextField.text
        if let city = city {
            if city.isEmpty {
                setDefaultTextValues()
            } else {
                self.presenter.loadWeatherForCity(city)
            }
        }
    }
    
    // MARK: - Private
    
    private func allowSpaces(_ city: String) -> String {
        return city.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)!
    }
}

// MARK: - Extensions

extension WeatherViewController: WeatherView {
    
    func setDefaultTextValues() {
        temperatureLabel.text = nil
        weatherDescriptionLabel.text = nil
        pressureLabel.text = nil
        humidityLabel.text = nil
        windSpeedLabel.text = nil
    }
    
    func showWeather(_ data: WeatherModel) {
        if let temperature = data.main?.temperature {
            self.temperatureLabel.text = String(temperature)
        }
        if let longWeather = data.weather?[0].description {
            self.weatherDescriptionLabel.text = longWeather
        }
        if let pressure = data.main?.pressure {
            self.pressureLabel.text = Constants.pressure + String(pressure)
        }
        if let humidity = data.main?.humidity {
            self.humidityLabel.text = Constants.humidity + String(humidity)
        }
        if let speed = data.wind?.speed {
            self.windSpeedLabel.text = Constants.windSpeed + String(speed)
        }
    }
}

extension WeatherViewController: UITextFieldDelegate {
    
    // UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        cityTextField.resignFirstResponder()
        return true
    }
}
