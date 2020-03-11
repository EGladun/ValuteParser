//
//  MoneyTableViewCell.swift
//  Parser
//
//  Created by Egor on 11.03.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import UIKit

class MoneyTableViewCell: UITableViewCell {
    @IBOutlet weak var rateLabel: UILabel?

    func awakeFromNib(rate: String) {
        super.awakeFromNib()
        // Initialization code
        self.rateLabel?.text = rate
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
