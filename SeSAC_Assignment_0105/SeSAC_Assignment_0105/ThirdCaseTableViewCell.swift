//
//  ThirdCaseTableViewCell.swift
//  SeSAC_Assignment_0105
//
//  Created by 이중엽 on 1/7/24.
//

import UIKit

class ThirdCaseTableViewCell: UITableViewCell {
    @IBOutlet var mainView: UIView!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var starButton: UIButton!

    @IBAction func checkButtonClicked(_ sender: UIButton) {
        checkButton.isSelected = !checkButton.isSelected
    }
    
    @IBAction func starButtonClicked(_ sender: UIButton) {
        starButton.isSelected = !starButton.isSelected
    }
}
