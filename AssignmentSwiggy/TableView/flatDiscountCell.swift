//
//  flatDiscountCell.swift
//  AssignmentSwiggy
//
//  Created by Sanskar IOS Dev on 07/12/24.
//

import UIKit

class flatDiscountCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imgPaging: UIPageControl!
    
    var imageData: [String] = [] {
        didSet {
            imgPaging.numberOfPages = imageData.count
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.register(UINib.init(nibName: "flatDiscountCVCell", bundle: nil), forCellWithReuseIdentifier: "cellCV")
        imgPaging.currentPage = 0
        imgPaging.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
    }
    @objc private func pageControlTapped(_ sender: UIPageControl) {
        let page = sender.currentPage
        let indexPath = IndexPath(item: page, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    
}
//MARK: CollectionView
extension flatDiscountCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch EstimateItemStatus.allCases[indexPath.section] {
        case .flateOff:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellCV", for: indexPath) as? flatDiscountCVCell else {
                return UICollectionViewCell()
            }
            let data = EstimateItemStatus.allCases[indexPath.section].displayPromotionData()[indexPath.item]
            cell.displayPromotionData(data)
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return EstimateItemStatus.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch EstimateItemStatus.allCases[section] {
        case .flateOff:
            return EstimateItemStatus.allCases[section].displayPromotionData().count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Handle item selection if needed
        print("Selected item at section \(indexPath.section), row \(indexPath.row)")
    }
    
    // MARK: - FlowLayout for Full-Width Cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: width, height: 180)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / collectionView.frame.width)
        imgPaging.currentPage = page
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // Adjust if needed
    }
    
    // MARK: - Horizontal Scrolling for Items within Each Section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0 // Remove spacing between cells if you want them to touch
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0 // Remove spacing between cells if you want them to touch
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sectionInsetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // Remove section insets if you want cells to touch
    }
    
}
