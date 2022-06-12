//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Mücahit Katırcı on 11.06.2022.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
  
  func didItemsFetch(_ items: [HomeHourlyCellViewModel])
  func didWeatherDataFetch(_ data: HomeViewViewModel)
}

class HomeViewModel {
  
  private var model = HomeModel()
  
  weak var delegate: HomeViewModelDelegate?
  
  func viewDidLoad() {
    fetchData()
  }
  
  func didUserTapRefresh() {
    fetchData()
  }
  
  private func fetchData() {
    model.fetchData { [weak self] data in
      guard let self = self else { return }
      
      let items = (data.hourly ?? []).map {
        HomeHourlyCellViewModel.init(
          degree: self.getCleanDegree(($0.temp ?? 0) - 273) + "°C",
          time: self.formatDate($0.dt ?? 0)
        )
      }
      
      self.delegate?.didItemsFetch(items)
      
      var homeViewViewModel = HomeViewViewModel()
      homeViewViewModel.temp = self.getCleanDegree((data.current?.temp ?? 0) - 273) + "°C"
      homeViewViewModel.location = data.timezone ?? "-"
      homeViewViewModel.status = (data.current?.weather.first?.description ?? "-").uppercased()
      
      self.delegate?.didWeatherDataFetch(homeViewViewModel)
    }
  }
}

// MARK: - Private Func
private extension HomeViewModel {
  
  func formatDate(_ timestamps: Int) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH"
    
    let date = Date.init(timeIntervalSince1970: TimeInterval(timestamps))
    
    return dateFormatter.string(from: date)
  }
  
  func getCleanDegree(_ degree: Double) -> String {
    return String(format: "%.0f", degree)
  }
}
