//
//  flatDiscountCell.swift
//  AssignmentSwiggy
//
//  Created by Sanskar IOS Dev on 07/12/24.
//

import UIKit


protocol FlatDiscountCellDelegate: AnyObject {
    func flatDiscountCell(_ cell: flatDiscountCell, didSelectItemWith data: PromotionData)
}



class flatDiscountCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imgPaging: UIPageControl!
    
    weak var delegate: FlatDiscountCellDelegate?

    var imageData: [String] = [] {
        didSet {
            imgPaging.numberOfPages = imageData.count
            collectionView.reloadData()
            startAutoScroll()
        }
    }
    private var autoScrollTimer: Timer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.register(UINib.init(nibName: "flatDiscountCVCell", bundle: nil), forCellWithReuseIdentifier: "cellCV")
        imgPaging.currentPage = 0
        imgPaging.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
    }
    
    deinit {
        stopAutoScroll()
    }
    
    @objc private func pageControlTapped(_ sender: UIPageControl) {
        let page = sender.currentPage
        let indexPath = IndexPath(item: page, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    // MARK: - Auto-Scroll Logic
    private func startAutoScroll() {
        stopAutoScroll() // Stop any existing timer
        autoScrollTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(scrollToNextPage), userInfo: nil, repeats: true)
    }
    
    private func stopAutoScroll() {
        autoScrollTimer?.invalidate()
        autoScrollTimer = nil
    }
    @objc private func scrollToNextPage() {
        let visibleIndex = Int(collectionView.contentOffset.x / collectionView.frame.width)
        let nextIndex = visibleIndex + 1
        
        if nextIndex < imageData.count {
            // Scroll to the next page
            let indexPath = IndexPath(item: nextIndex, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            imgPaging.currentPage = nextIndex
        } else {
            // Reset to the first page smoothly
            let indexPath = IndexPath(item: 0, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            imgPaging.currentPage = 0
        }
    }
    
    // MARK: - Selection
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}
//MARK: CollectionView
extension flatDiscountCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellCV", for: indexPath) as? flatDiscountCVCell else {
                return UICollectionViewCell()
            }
            let data = EstimateItemStatus.allCases[indexPath.section].displayPromotionData()[indexPath.item]
            cell.displayPromotionData(data)
        
            return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return EstimateItemStatus.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Handle item selection if needed
        print("Selected item at section \(indexPath.section), row \(indexPath.row)")
        let selectedData = EstimateItemStatus.allCases[indexPath.section].displayPromotionData()[indexPath.item]
            delegate?.flatDiscountCell(self, didSelectItemWith: selectedData)
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
