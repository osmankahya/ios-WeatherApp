//
//  DarkSkyError.swift
//  WeatherApp
//
//  Created by Osman Kahya on 17.03.2020.
//  Copyright © 2020 Osman Kahya. All rights reserved.
//

import Foundation


enum DarkSkyError {
    
    case RequestError
    case ResponseUnsuccesful(statusCode : Int)
    case invalidData
    case JSONParsingError
    case invalidURL
}
