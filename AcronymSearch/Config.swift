//
//  Config.swift
//  AcronymSearch
//
//  Created by Suvidha Nakhawa on 6/7/22.
//

import UIKit

struct Config: Decodable {
    let acronym_endpoint: String
}

struct ConfigValues {
    static func get() -> Config{
        guard let configUrl = Bundle.main.url(forResource: "Config", withExtension: "plist") else {
            fatalError("Config.plist not found")
        }
        do {
            let data = try Data(contentsOf: configUrl)
            let decoder = PropertyListDecoder()
            
            return try decoder.decode(Config.self, from: data)
        } catch {
            fatalError("Error fetching config")
        }
    }
}
