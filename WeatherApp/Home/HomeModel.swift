//
//  HomeModel.swift
//  WeatherApp
//
//  Created by Mücahit Katırcı on 11.06.2022.
//

import Foundation

protocol HomeModelDelegate: AnyObject {
  
  func didDataFetch(_ data: Weather)
}

class HomeModel {
  
  private let weatherApiURL = "https://api.openweathermap.org/data/2.5/onecall?lat=39.3123&lon=26.1232&exclude=daily&appid=8f916d970abee3b68204508eeeb3695a"
  
  weak var delegate: HomeModelDelegate?
  
  func fetchData(completion: @escaping ((Weather) -> ())) {
    if let url = URL.init(string: weatherApiURL) {
      let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
        
        do {
          guard let data = data else {
            return
          }
          
          let object = try JSONDecoder().decode(Weather.self, from: data)
          
          DispatchQueue.main.async {
            completion(object)
          }
//          self?.delegate?.didDataFetch(object)
          
        } catch {
          print(error)
        }
      }
      
      task.resume()
    }
  }
}
