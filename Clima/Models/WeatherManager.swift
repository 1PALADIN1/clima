//
//  WeatherManager.swift
//  Clima
//
//  Created by Ruslan Malinovsky on 20.04.2022.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    
    var delegate: WeatherManagerDelegate?
    
    private let configModel = ConfigModel()
    
    func fetchWeather(for cityName: String) {
        let urlString = "\(configModel.getWeatherBaseUrl())appid=\(configModel.getApiId())&q=\(cityName)&units=metric"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: Double, longitude: Double) {
        let urlString = "\(configModel.getWeatherBaseUrl())appid=\(configModel.getApiId())&lat=\(latitude)&lon=\(longitude)&units=metric"
        performRequest(with: urlString)
    }
    
    private func performRequest(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let e = error {
                self.delegate?.didFailWithError(error: e)
                return
            }
            
            if let safeData = data {
                if let weather = self.parseWeatherData(safeData) {
                    self.delegate?.didUpdateWeather(self, weather: weather)
                }
            }
        }
        
        task.resume()
    }
    
    private func parseWeatherData(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            return WeatherModel(conditionId: id, cityName: name, tempreture: temp)
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
