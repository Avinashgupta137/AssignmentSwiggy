//
//  StickyHeaderView.swift
//  AssignmentSwiggy
//
//  Created by Sanskar IOS Dev on 07/12/24.
//

import UIKit

class StickyHeaderView: UIView {
    
    
    @IBOutlet weak var btnLocation: UIButton!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var HeaderView: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib()
    }
    
    
    private func loadFromNib() {
        let nib = UINib(nibName: "StickyHeaderView", bundle: nil)
        guard nib.instantiate(withOwner: self, options: nil).first is UIView else {
            fatalError("Could not load StickyHeaderView from nib")
        }
        HeaderView.frame = bounds
        HeaderView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(HeaderView)
    }
    
    func configureHeader(location: String, profileImage: UIImage?) {
        lblLocation.text = location
        imgProfile.image = profileImage
    }
}
