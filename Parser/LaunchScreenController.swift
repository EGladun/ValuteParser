//
//  LaunchScreenController.swift
//  Parser
//
//  Created by Egor on 11.03.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import UIKit

class LaunchScreenController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
}
