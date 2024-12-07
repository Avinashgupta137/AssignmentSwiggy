//
//  ViewController.swift
//  AssignmentSwiggy
//
//  Created by Sanskar IOS Dev on 07/12/24.
//

import UIKit


class MainViewController: UIViewController {
    
    @IBOutlet weak var headerView: StickyHeaderView!
    @IBOutlet weak var mailCollectionView: UICollectionView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStickyHeader()
        uiUpdate()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let headerHeight = headerView.frame.height
        print("Header view height: \(headerHeight)")
    }

    private func setupStickyHeader() {
        headerView.configureHeader(location: "Block 1st floor swiggy Embasssy Tech", profileImage: UIImage(systemName: "person.crop.circle.fill"))
        headerView.searchBar.delegate = self
    }
    func uiUpdate() {
        mailCollectionView.register(UINib.init(nibName: "flatOffCVCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
    
}

extension MainViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, !query.isEmpty else { return }
        print("Search for: \(query)")
    }
}
//MARK: CollectionView
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch EstimateItemStatus.allCases[indexPath.section] {
        case .flateOff:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? flatOffCVCell else {
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

    // MARK: - FlowLayout
    
}
