//
//  FoodWeekCollectionViewCell.swift
//  AssignmentSwiggy
//
//  Created by Avinash Gupta on 07/12/24.
//

import UIKit

class FoodWeekCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgFoodWeek: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    func displayFoodWeek(_ data: FoodWeek) {
        imgFoodWeek.image = data.image
    }
}
