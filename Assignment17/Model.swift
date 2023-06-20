//
//  Model.swift
//  Assignment17
//
//  Created by macbook  on 20.06.23.
//

import Foundation

struct WeatherData: Codable {
    let weather: [Weather]
    let main: MainData
    let wind: Wind
    
    struct Weather: Codable {
        let description: String
    }

    struct MainData: Codable {
        let temp: Double
        let feels_like: Double
        let humidity: Int
    }

    struct Wind: Codable {
        let speed: Double
        let deg: Int
    }

    struct Sun: Codable {
        let sunrise: Int
        let sunset: Int
    }
}

struct City {
    let name: String
    let logitutde: Double
    let latitude: Double
    
    static let tbilisi = City(name: "Tbilisi", logitutde: 44.7833, latitude: 41.7166)
    static let paris = City(name: "Paris", logitutde: 2.3490, latitude: 48.8647)
    static let london = City(name: "London", logitutde: -0.1180, latitude: 51.5072)
}

