//
//  DarkSkyAPIClient.swift
//  WeatherApp
//
//  Created by Osman Kahya on 17.03.2020.
//  Copyright © 2020 Osman Kahya. All rights reserved.
//

import Foundation

class DarkSkyAPIClient{
    fileprivate let apiKeyDarSky = "03fa71756a02de66ee5ddf5a87061a9f"
    
    lazy var baseURL: URL = {
        return URL(string: "https://api.darksky.net/forecast/\(self.apiKeyDarSky)/")!
    }()
    
    let downloader = JSONDownloader()
    
    typealias CurrentWeatherTypeCompletionHandler = (CurrentWeather?, DarkSkyError?) -> Void
    typealias WeatherComplitionHandler = (Weather?, DarkSkyError?) -> Void
    private func getWeather(at coordinate: Coordinate, completionHandler completion: @escaping WeatherComplitionHandler){
        
        guard let url = URL(string: coordinate.description, relativeTo: baseURL) else {
            completion(nil, DarkSkyError.invalidURL)
            return
        }
        
        let requestURL = URLRequest(url: url)
        
        let task = downloader.jsonTask(with: requestURL){ json, error in
            
            guard let json = json else{
                completion(nil, error)
                return
            }
            
            guard let weather = Weather(json: json) else{
                completion(nil, DarkSkyError.JSONParsingError)
                return
            }
            
            completion(weather, nil)
        }
        task.resume()
    }
    
    func getCurrentWeather(at coordinate: Coordinate, completionHandler completion: @escaping CurrentWeatherTypeCompletionHandler){
        getWeather(at: coordinate) {weather, error in
            completion(weather?.currently, error)
        }
    }
}
