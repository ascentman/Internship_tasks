//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Vova on 11/29/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

final class WeatherViewController: UIViewController {
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    private var presenter: WeatherPresenter!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = WeatherPresenter()
        presenter.attachView(self)
        cityTextField.delegate = self
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        let city = cityTextField.text
        if let city = city {
            presenter.loadWeatherFor(city: city)
        }
    }
}

extension WeatherViewController: WeatherPresenterProtocol {
    
    // MARK: - WeatherPresenterProtocol
    
    func showWeather(data: RequestModel) {
        temperatureLabel.text = data.temperature
        weatherDescriptionLabel.text = data.weatherDescription
        pressureLabel.text = data.pressure
        humidityLabel.text = data.humidity
        windSpeedLabel.text = data.windSpeed
    }
}

extension WeatherViewController: UITextFieldDelegate {
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        cityTextField.resignFirstResponder()
        return true
    }
}
