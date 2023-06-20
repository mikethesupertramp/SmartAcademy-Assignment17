//
//  ViewController.swift
//  Assignment17
//
//  Created by macbook  on 20.06.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelLikeLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initGradient()
        loadWeather(City.tbilisi)
        
    }
    
    func initGradient() {
        let gradient = CAGradientLayer()
        
        gradient.frame = view.bounds
        gradient.colors = [
            UIColor(red: 0.03, green: 0.046, blue: 0.340, alpha: 1).cgColor,
            UIColor(red: 0.419, green: 0.046, blue: 0.340, alpha: 1).cgColor
        ]
        
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
    func loadWeather(_ city: City) {
        WeatherService.shared.getWeatherInfo(city: city) { data in
            self.cityLabel.text = city.name
            self.descriptionLabel.text = data.weather[0].description
            self.temperatureLabel.text = String(format: "%.0f°C", data.main.temp)
            self.feelLikeLabel.text = String(format: "Feels Like: %.0f°C", data.main.feels_like)
            self.windSpeedLabel.text = String(format: "%.1fm/s", data.wind.speed)
            self.humidityLabel.text = String(format: "%d%%", data.main.humidity)
        }
    }
}

