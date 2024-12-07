//
//  ViewController.swift
//  AssignmentSwiggy
//
//  Created by Sanskar IOS Dev on 07/12/24.
//

import UIKit


class MainViewController: UIViewController {
    
    @IBOutlet weak var headerView: StickyHeaderView!
    @IBOutlet weak var tableView: UITableView!
    
   
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
        tableView.register(UINib(nibName: "flatDiscountCell", bundle: nil), forCellReuseIdentifier: "cellTV")
//        mailCollectionView.register(UINib.init(nibName: "flatOffCVCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
    
}

extension MainViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, !query.isEmpty else { return }
        print("Search for: \(query)")
    }
}

//MARK: - TAbleVIew

extension MainViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}


//MARK: CollectionView
//extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout , UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        switch EstimateItemStatus.allCases[indexPath.section] {
//        case .flateOff:
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? flatOffCVCell else {
//                        return UICollectionViewCell()
//                   }
//            let data = EstimateItemStatus.allCases[indexPath.section].displayPromotionData()[indexPath.item]
//            cell.displayPromotionData(data)
//            return cell
//        }
//    }
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return EstimateItemStatus.allCases.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        switch EstimateItemStatus.allCases[section] {
//        case .flateOff:
//            return EstimateItemStatus.allCases[section].displayPromotionData().count
//        }
//    }
//   
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        // Handle item selection if needed
//        print("Selected item at section \(indexPath.section), row \(indexPath.row)")
//    }
//
//    // MARK: - FlowLayout for Full-Width Cells
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            let width = collectionView.frame.width // Make the cell width match the screen width
//            return CGSize(width: width, height: 200) // Adjust the height as needed (e.g., 200)
//        }
//        
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//            return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0) // Adjust if needed
//        }
//        
//        // MARK: - Horizontal Scrolling for Items within Each Section
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//            return 0 // Remove spacing between cells if you want them to touch
//        }
//
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//            return 0 // Remove spacing between cells if you want them to touch
//        }
//
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sectionInsetForSectionAt section: Int) -> UIEdgeInsets {
//            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // Remove section insets if you want cells to touch
//        }
//}
