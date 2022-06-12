//
//  HomeCollectionViewHelper.swift
//  WeatherApp
//
//  Created by Mücahit Katırcı on 11.06.2022.
//

import UIKit

class HomeCollectionViewHelper: NSObject {
  
  private var hourly: [HomeHourlyCellViewModel] = []
  
  weak var vm: HomeViewModel?
  weak var collectionView: UICollectionView?
  
  init(
    with collectionView: UICollectionView,
    vm: HomeViewModel
  ) {
    super.init()
    
    self.collectionView = collectionView
    self.vm = vm
    
    self.collectionView?.delegate = self
    self.collectionView?.dataSource = self
    
    registerCell()
  }
  
  private func registerCell() {
    collectionView?.register(.init(nibName: "WeatherCell", bundle: nil), forCellWithReuseIdentifier: "WeatherCell")
  }
  
  func setItems(_ items: [HomeHourlyCellViewModel]) {
    self.hourly = items
    collectionView?.reloadData()
  }
}

extension HomeCollectionViewHelper: UICollectionViewDelegate { }

extension HomeCollectionViewHelper: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
    
    let rowItem = hourly[indexPath.row]
    cell.degreeLabel.text = rowItem.degree
    cell.hourLabel.text = rowItem.time
    
    if indexPath.row == 0 {
      cell.moveUp()
    } else {
      cell.moveDown()
    }
  
    return cell
  }
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return hourly.count
  }
}

extension HomeCollectionViewHelper: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: 120, height: 186)
  }
}
