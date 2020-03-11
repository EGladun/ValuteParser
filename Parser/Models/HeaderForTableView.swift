//
//  HeaderForTableView.swift
//  Parser
//
//  Created by Egor on 11.03.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import UIKit

class HeaderForTableView: UIView {
    //@IBOutlet weak var headerLabel: UILabel!

    init(text: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        label.center = CGPoint(x: 200, y: 15)
        label.textAlignment = .center
        label.text = text
        self.addSubview(label)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
