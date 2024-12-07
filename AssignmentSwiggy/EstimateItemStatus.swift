//
//  EstimateItemStatus.swift
//  AssignmentSwiggy
//
//  Created by Sanskar IOS Dev on 07/12/24.
//

import Foundation
import UIKit.UIImageView

enum EstimateItemStatus: CaseIterable {
    case flateOff
   

    func displayPromotionData() -> [PromotionData] {
        return promotionDisplayData
    }
    
}






struct PromotionData {
    let image: UIImage?
}

let promotionDisplayData = [PromotionData(image: UIImage(named: "flatdiscount2")), PromotionData(image: UIImage(named: "flatdiscount")), PromotionData(image: UIImage(named: "flatdiscount2"))]
