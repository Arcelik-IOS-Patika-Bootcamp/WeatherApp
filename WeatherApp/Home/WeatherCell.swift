//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Mücahit Katırcı on 4.06.2022.
//

import UIKit

class WeatherCell: UICollectionViewCell {
  
  @IBOutlet weak var containerView: UIView!
  @IBOutlet private weak var containerViewTopConstraint: NSLayoutConstraint!
  @IBOutlet private weak var containerViewBottomConstraint: NSLayoutConstraint!
  
  @IBOutlet private(set) weak var hourLabel: UILabel!
  
  @IBOutlet private(set) weak var statusImageView: UIImageView!
  @IBOutlet private(set) weak var degreeLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    setupUI()
  }
  
  func setupUI() {
    containerView.layer.cornerRadius = 52
    containerView.layer.borderWidth = 1
    containerView.layer.borderColor = UIColor.lightGray.cgColor
  }
  
  func moveUp() {
    containerViewTopConstraint.constant = 0
    containerViewBottomConstraint.constant = 32
  }
  
  func moveDown() {
    containerViewTopConstraint.constant = 16
    containerViewBottomConstraint.constant = 16
  }
}
