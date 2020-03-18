//
//  Coordinate.swift
//  WeatherApp
//
//  Created by Osman Kahya on 17.03.2020.
//  Copyright © 2020 Osman Kahya. All rights reserved.
//

import Foundation

struct Coordinate {
    let latitude: Double
    let longitude: Double
}

extension Coordinate: CustomStringConvertible{
    var description: String {
        return "\(latitude),\(longitude)"
    }
    
    static var alcatrazIsland: Coordinate{
        return Coordinate(latitude: 37.8267, longitude: -122.4233)
    }
}

