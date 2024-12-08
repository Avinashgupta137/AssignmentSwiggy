//
//  DetailsViewController.swift
//  AssignmentSwiggy
//
//  Created by Sanskar IOS Dev on 07/12/24.
//

import UIKit

class DetailsViewController: UIViewController {
    var data: PromotionData?
    weak var delegate: FlatDiscountCellDelegate?
    
    @IBOutlet weak var imgMain: UIImageView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiUpdate()
        
        
        
    }
    
    
    @IBAction func btnAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func uiUpdate(){
        imgMain.image = data?.image
        lblTitle.text = data?.title
        lblDesc.text = data?.desc
    }
    
}
