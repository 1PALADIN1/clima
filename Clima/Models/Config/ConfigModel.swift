//
//  ConfigModel.swift
//  Clima
//
//  Created by Ruslan Malinovsky on 20.04.2022.
//

import Foundation

struct ConfigModel {
    
    private var weatherBaseUrl: String?
    private var apiId: String?
    
    init() {
        if let safeConfig = loadConfig() {
            weatherBaseUrl = safeConfig.weatherBaseUrl
            apiId = safeConfig.apiId
        }
    }
    
    func getWeatherBaseUrl() -> String {
        return weatherBaseUrl ?? ""
    }
    
    func getApiId() -> String {
        return apiId ?? ""
    }
    
    private func loadConfig() -> ConfigData? {
        guard let url = Bundle.main.url(forResource: "Config", withExtension: "plist") else {
            print("Error loading Config.plist...")
            return nil
        }
        
        let decoder = PropertyListDecoder()
        
        do {
            let data = try Data(contentsOf: url)
            let decodedData = try decoder.decode(ConfigData.self, from: data)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
}
