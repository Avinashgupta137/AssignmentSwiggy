//
//  CollectionViewCell.swift
//  AssignmentSwiggy
//
//  Created by Sanskar IOS Dev on 07/12/24.
//

import UIKit

class flatOffCVCell: UICollectionViewCell {

    @IBOutlet weak var imgFlatOff: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
   
    }

    func displayPromotionData(_ data: PromotionData) {
        imgFlatOff.image = data.image
    }
    
}
