 //
//  CurrentWeatherModel.swift
//  WeatherApp
//
//  Created by Osman Kahya on 16.03.2020.
//  Copyright © 2020 Osman Kahya. All rights reserved.
//

import Foundation
import UIKit
 
 struct CurrentWeatherModel {
     
     let summary : String
     let icon : UIImage
     let temperature : String
     let humidity : String
     let precipitationProbability : String
     
     init(data : CurrentWeather) {
         
         self.summary = data.summary
         self.icon = data.iconImage
         self.precipitationProbability = "%\(data.precipProbability * 100) "
         self.temperature = "\(Int(data.temperature))°"
         self.humidity = "%\(Int(data.humidity*100))"
         
     }
     
     
 }
