//
//  Weather.swift
//  WeatherApp
//
//  Created by Osman Kahya on 17.03.2020.
//  Copyright © 2020 Osman Kahya. All rights reserved.
//

import Foundation

struct Weather {
    let currently: CurrentWeather
}

extension Weather{
    
    init?(json: [String: AnyObject]) {
        guard let currentWeatherJson = json["currently"] as? [String: AnyObject], let currentWeather = CurrentWeather(json: currentWeatherJson) else {
            return nil
        }
        self.currently = currentWeather
    }
}
