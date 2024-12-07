//
//  flatDiscountCVCell.swift
//  AssignmentSwiggy
//
//  Created by Sanskar IOS Dev on 07/12/24.
//

import UIKit

class flatDiscountCVCell: UICollectionViewCell {

    @IBOutlet weak var imgCellCV: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func displayPromotionData(_ data: PromotionData) {
        imgCellCV.image = data.image
    }
}
