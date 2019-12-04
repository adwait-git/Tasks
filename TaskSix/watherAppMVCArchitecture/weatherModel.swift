//
//  weatherModel.swift
//  TaskSix
//
//  Created by AllSpark on 03/12/19.
//  Copyright © 2019 AllSpark. All rights reserved.
//

import Foundation
struct WeatherElement: Codable {
    let distance: Int?
    let title: String?
    let locationType: LocationType?
    let woeid: Int?
    let lattLong: String?
    
    enum CodingKeys: String, CodingKey {
        case distance, title
        case locationType
        case woeid
        case lattLong
    }
}

enum LocationType: String, Codable {
    case city = "City"
}

typealias Weather = [WeatherElement]
