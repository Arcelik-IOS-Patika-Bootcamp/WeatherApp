//
//  SecondViewController.swift
//  WeatherApp
//
//  Created by Mücahit Katırcı on 5.06.2022.
//

import UIKit
import WebKit

class SecondViewController: UIViewController {

  @IBOutlet weak var webView: WKWebView!
  @IBOutlet weak var indicator: UIActivityIndicatorView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    indicator.startAnimating()
    
    webView.navigationDelegate = self
    
    if let url = URL.init(string: "https://tr.wikipedia.org/wiki/Anasayfa") {
      let request = URLRequest.init(url: url)
      webView.load(request)
    }
  }
}

extension SecondViewController: WKNavigationDelegate {
  
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    print("didFinish navigation")
    indicator.stopAnimating()
    indicator.isHidden = true
  }
}
