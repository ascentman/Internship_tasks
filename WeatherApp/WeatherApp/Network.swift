//
//  Network.swift
//  WeatherApp
//
//  Created by user on 11/12/18.
//  Copyright © 2018 user. All rights reserved.
//

import Foundation

final class Network {
    static let shared = Network()
    private let apiKey = "&appid=92a2a82ad096930adb7e887897d1f5f7"
    private let url = "http://api.openweathermap.org/data/2.5/weather?q="
    private let celciusMetric = "&units=metric"
    
    private init() {}
    
    func getWeather(_ forCity: String, _ completion: @escaping (WeatherModel?, Error?)->()) {
        let fullURL = url + forCity + celciusMetric + apiKey
        guard let weatherUrl = URL(string: fullURL) else {
            return
        }
        URLSession.shared.dataTask(with: weatherUrl) { (data, _, error) in
            guard let data = data, error == nil else {
                return completion(nil, error)
            }
            do {
                let decoder = JSONDecoder()
                let weatherData = try decoder.decode(WeatherModel.self, from: data)
                completion(weatherData, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
