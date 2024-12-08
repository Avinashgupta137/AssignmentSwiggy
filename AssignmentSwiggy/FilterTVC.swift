//
//  FilterTVC.swift
//  AssignmentSwiggy
//
//  Created by suraj bhardwaj on 08/12/24.
//

import UIKit

class FilterTVC: UITableViewCell {

    
    @IBOutlet weak var filterCollection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        filterCollection.delegate = self
        filterCollection.dataSource = self
        filterCollection.register(UINib(nibName: "FilterCVC", bundle: nil), forCellWithReuseIdentifier: "FilterCVC")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension FilterTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 // Total number of items
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCVC", for: indexPath) as? FilterCVC else {
            return UICollectionViewCell()
        }
        return cell
    }

    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Define item size
        let numberOfItemsPerRow: CGFloat = 4 // Adjust for desired number of items per row
        let spacing: CGFloat = 10 // Spacing between items
        let totalSpacing = (numberOfItemsPerRow - 1) * spacing // Total horizontal spacing
        
        // Calculate item width based on collection view width and spacing
        let itemWidth = (collectionView.bounds.width - totalSpacing) / numberOfItemsPerRow
        
        // Define item height (optional customization)
        let itemHeight: CGFloat = itemWidth // Square items
        
        return CGSize(width: itemWidth, height: itemHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10 // Vertical spacing between rows
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10 // Horizontal spacing between items
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Section insets
    }
}
