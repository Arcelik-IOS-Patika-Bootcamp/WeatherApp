//
//  JsonObject.swift
//  WeatherApp
//
//  Created by Mücahit Katırcı on 5.06.2022.
//

import Foundation

struct Weather: Codable {
  var current: Current?
  var hourly: [HourlyWeather]?
  var timezone: String?
}

struct Current: Codable {
  var temp: Double?
  var pressure: Int?
  var windSpeed: Double?
  var weather: [WeatherStatus]
  
  enum CodingKeys: String,CodingKey {
    case temp
    case pressure
    case weather
    case windSpeed = "wind_speed"
  }
}

struct WeatherStatus: Codable {
  var description: String?
}

struct HourlyWeather: Codable {
  var dt: Int?
  var temp: Double?
}

struct HomeHourlyCellViewModel {
  let degree: String?
  let time: String?
}

struct HomeViewViewModel {
  var status: String?
  var temp: String?
  var location: String?
}
