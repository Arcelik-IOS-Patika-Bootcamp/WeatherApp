//
//  ViewController.swift
//  WeatherApp
//
//  Created by Mücahit Katırcı on 4.06.2022.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet private weak var weatherStatusImageView: UIImageView!
  @IBOutlet private weak var weatherStatusLabel: UILabel!
  @IBOutlet private weak var weatherDegreeLabel: UILabel!
  @IBOutlet private weak var locationLabel: UILabel!
  @IBOutlet private weak var collectionView: UICollectionView!
  @IBOutlet private weak var windTitleLabel: UILabel!
  @IBOutlet private weak var windValueLabel: UILabel!
  @IBOutlet private weak var rainValueLabel: UILabel!
  @IBOutlet private weak var rainTitleLabel: UILabel!
  @IBOutlet private weak var pressureValueLabel: UILabel!
  @IBOutlet private weak var pressureTitleLabel: UILabel!
  @IBOutlet private weak var refreshButton: UIButton!
  
  private var viewModel = HomeViewModel()
  private var collectionViewHelper: HomeCollectionViewHelper!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
    viewModel.viewDidLoad()
  }
  
  @IBAction private func refreshButtonPressed(_ sender: Any) {
    viewModel.didUserTapRefresh()
  }
  
  private func setupUI() {
    collectionViewHelper = .init(
      with: collectionView,
      vm: viewModel
    )
    
    refreshButton.tintColor = .white
    
    viewModel.delegate = self
  }
  
  private func prepareUI(_ model: HomeViewViewModel) {
    weatherStatusLabel.text = model.status
    locationLabel.text = model.location
    weatherDegreeLabel.text = model.temp
  }
}

extension ViewController: HomeViewModelDelegate {
  
  func didItemsFetch(_ items: [HomeHourlyCellViewModel]) {
    collectionViewHelper.setItems(items)
  }
  
  func didWeatherDataFetch(_ data: HomeViewViewModel) {
    prepareUI(data)
  }
}
