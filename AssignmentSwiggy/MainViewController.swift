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
    
    let refreshControl = UIRefreshControl()
    
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
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.register(UINib(nibName: "FoodWeekTVCell", bundle: nil), forCellReuseIdentifier: "cellTVfood")
        tableView.register(UINib(nibName: "flatDiscountCell", bundle: nil), forCellReuseIdentifier: "cellTV")
    }
    @objc func refreshData(){
        tableView.reloadData()
        refreshControl.endRefreshing()
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
        case .foodweek:
            return 1
        case .flateOff:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch EstimateItemStatus.allCases[indexPath.section] {
        case .foodweek:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellTVfood", for: indexPath) as? FoodWeekTVCell else {
                return UITableViewCell()
            }
            return cell
        case .flateOff:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellTV", for: indexPath) as? flatDiscountCell else {
                return UITableViewCell()
            }
            return cell
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return EstimateItemStatus.allCases.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            switch EstimateItemStatus.allCases[indexPath.section] {
            case .foodweek:
                return 190
            case .flateOff:
                return 190
            }
        }
}

