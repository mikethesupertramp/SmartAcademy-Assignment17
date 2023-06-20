//
//  WeatherService.swift
//  Assignment17
//
//  Created by macbook  on 20.06.23.
//

import Foundation

class WeatherService {
    private static let weatherUrl = "https://api.openweathermap.org/data/2.5/weather"
    private static let apiKey = "faaad98c5d2f17fcf553bf4e1141ee8c" //Stolen from lecture files
    
    
    public static let shared = WeatherService()
    
    private init() {
        
    }
    
    //Merged into one function as there will be no other functions simmilar to this
    //Within the scope of assignment
    //Also, hiding away the implementation of getting weather in the service away from view
    //So view only known that it is getting weather and can work with any other implementation later
    public func getWeatherInfo(city: City, completion: @escaping (WeatherData) -> Void) {
        var urlComponent = URLComponents(string: WeatherService.weatherUrl)
        
        urlComponent?.queryItems =  [
            URLQueryItem(name: "lon", value: "\(city.logitutde)"),
            URLQueryItem(name: "lat", value: "\(city.latitude)"),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "appid", value: WeatherService.apiKey),
        ]
        
        var request = URLRequest(url: (urlComponent?.url!)!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            guard let data else { return }

            let decoder = JSONDecoder()
            let weather = try? decoder.decode(WeatherData.self, from: data)
         
            guard let weather else { return }
            
            DispatchQueue.main.async {
                completion(weather)
            }
        }.resume()
    }
}


