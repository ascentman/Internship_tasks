//
//  RootViewController.swift
//  WeatherApp
//
//  Created by user on 11/11/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

final class RootViewController: UIViewController {
    
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var weatherDescriptionLabel: UILabel!
    @IBOutlet private weak var pressureLabel: UILabel!
    @IBOutlet private weak var humidityLabel: UILabel!
    @IBOutlet private weak var windSpeedLabel: UILabel!
    @IBOutlet private weak var cityTextField: UITextField!
    
    var weatherViewModel = WeatherViewModel()

    // MARK: - Lifecycle
 
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTextField.delegate = self
        
        weatherViewModel.temperature.bind { [unowned self] in
            self.temperatureLabel.text = $0
        }
        weatherViewModel.pressure.bind { [unowned self] in
            self.pressureLabel.text = $0
        }
        weatherViewModel.humidity.bind { [unowned self] in
            self.humidityLabel.text = $0
        }
        weatherViewModel.description.bind { [unowned self] in
            self.weatherDescriptionLabel.text = $0
        }
        weatherViewModel.windSpeed.bind { [unowned self] in
            self.windSpeedLabel.text = $0
        }
    }

    @IBAction func buttonClicked(_ sender: Any) {
        let city = cityTextField.text
        if let city = city {
            weatherViewModel.getWeatherFor(city: city)
        }
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
