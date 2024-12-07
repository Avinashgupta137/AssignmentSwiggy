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
        switch EstimateItemStatus.allCases[section] {
        case .flateOff:
            return EstimateItemStatus.allCases[section].displayPromotionData().count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch EstimateItemStatus.allCases[indexPath.section] {
        case .flateOff:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellTV", for: indexPath) as? flatDiscountCell else {
                return UITableViewCell()
            }
            let data = EstimateItemStatus.allCases[indexPath.section].displayPromotionData()[indexPath.item]
            //  cell.displayPromotionData(data)
            return cell
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return EstimateItemStatus.allCases.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            switch EstimateItemStatus.allCases[indexPath.section] {
            case .flateOff:
                return 250 
            }
        }
}

