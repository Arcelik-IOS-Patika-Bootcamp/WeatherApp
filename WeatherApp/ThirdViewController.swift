//
//  ThirdViewController.swift
//  WeatherApp
//
//  Created by Mücahit Katırcı on 5.06.2022.
//

import UIKit
import Kingfisher

class ThirdViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let url = URL.init(string: "https://picsum.photos/300/300")
    
    imageView.kf.setImage(with: url, placeholder: nil, options: nil, completionHandler: nil)
    
  }
}
