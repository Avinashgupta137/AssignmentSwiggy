//
//  EstimateItemStatus.swift
//  AssignmentSwiggy
//
//  Created by Sanskar IOS Dev on 07/12/24.
//

import Foundation
import UIKit.UIImageView

enum EstimateItemStatus: CaseIterable {
    case foodweek
    case flateOff
    case dishes
    case filter
    case restro
    
    func displayFoodWeek() -> [FoodWeek] {
        return displayDisFoodWeek
    }
    func displayPromotionData() -> [PromotionData] {
        return promotionDisplayData
    }
}


struct FoodWeek {
    let image: UIImage?
}
let displayDisFoodWeek = [FoodWeek(image: UIImage(named: "flatdiscount2"))]
struct Restro {
    let image: UIImage?
}
let displayRestro = [Restro(image: UIImage(named: "flatdiscount2"))]


struct PromotionData {
    let image: UIImage?
    let title: String?
    let desc: String?
}


let promotionDisplayData = [
    PromotionData(image: UIImage(named: "flatdiscount3"), title: "Flat Discount 1", desc: "Get amazing discounts on your first purchase."),
    PromotionData(image: UIImage(named: "flatdiscount4"), title: "Flat Discount 2", desc: "Special offers for premium customers."),
    PromotionData(image: UIImage(named: "flatdiscount5"), title: "Flat Discount 3", desc: "Hurry up! Limited time discounts.")
]
