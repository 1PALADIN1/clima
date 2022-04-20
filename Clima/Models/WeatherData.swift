//
//  WeatherData.swift
//  Clima
//
//  Created by Ruslan Malinovsky on 20.04.2022.
//

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather : Decodable {
    let id: Int
}
