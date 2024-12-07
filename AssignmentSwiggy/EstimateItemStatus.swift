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
    case foodweek

    func displayPromotionData() -> [PromotionData] {
        return promotionDisplayData
    }
    
    func displayFoodWeek() -> [FoodWeek] {
        return displayDisFoodWeek
    }
}


struct FoodWeek {
    let image: UIImage?
}

let displayDisFoodWeek = [FoodWeek(image: UIImage(named: "flatdiscount2"))]



struct PromotionData {
    let image: UIImage?
}

let promotionDisplayData = [PromotionData(image: UIImage(named: "flatdiscount2")), PromotionData(image: UIImage(named: "flatdiscount")), PromotionData(image: UIImage(named: "flatdiscount2"))]
