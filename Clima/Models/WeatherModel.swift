//
//  WeatherModel.swift
//  Clima
//
//  Created by Ruslan Malinovsky on 20.04.2022.
//

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let tempreture: Double
    
    var temperatureString: String {
        return String(format: "%.1f", tempreture)
    }
    
    var conditionName: String {
        switch conditionId {
        case 200..<300:
            return "cloud.bolt.fill"
        case 300..<400:
            return "cloud.drizzle.fill"
        case 500..<600:
            return "cloud.rain.fill"
        case 600..<700:
            return "cloud.snow.fill"
        case 700..<800:
            return "tornado"
        case 800:
            return "sun.max.fill"
        default:
            return "cloud.fill"
        }
    }
}
