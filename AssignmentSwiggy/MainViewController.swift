//
//  ViewController.swift
//  AssignmentSwiggy
//
//  Created by Sanskar IOS Dev on 07/12/24.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var headerView: StickyHeaderView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerHeight: NSLayoutConstraint!
    
    let refreshControl = UIRefreshControl()
    var previousScrollOffset: CGFloat = 0
    private var isHeaderVisible: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.bounces = true
        setupStickyHeader()
        uiUpdate()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerHeight.constant = headerView.frame.height
        print("Header view height: \(headerView.frame.height)")
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
        tableView.register(UINib(nibName: "RestaurantsTVC", bundle: nil), forCellReuseIdentifier: "RestaurantsTVC")
        tableView.register(UINib(nibName: "DishesTVC", bundle: nil), forCellReuseIdentifier: "DishesTVC")
    }
    @objc func refreshData(){
        tableView.reloadData()
        refreshControl.endRefreshing()
    }

    func hideHeaderView() {
        guard isHeaderVisible else { return }
        isHeaderVisible = false
        tableView.bounces = false
        UIView.animate(withDuration: 0.3, animations: {
            self.headerView.isHidden = true
            self.headerHeight.constant = 0
            self.headerView.alpha = 0.0
            self.view.layoutIfNeeded()
        })
    }

    func showHeaderView() {
        guard !isHeaderVisible else { return }
        isHeaderVisible = true
        tableView.bounces = true
        UIView.animate(withDuration: 0.3, animations: {
            self.headerView.isHidden = false
            self.headerHeight.constant = 100
            self.headerView.alpha = 1.0
            self.view.layoutIfNeeded()
        })
    }
}

//MARK: - TAbleVIew
extension MainViewController : UITableViewDelegate , UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch EstimateItemStatus.allCases[section] {
        case .foodweek:
            return 1
        case .flateOff:
            return 1
        case .dishes:
            return 1
        case .restro:
            return 10
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
        case .dishes:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DishesTVC", for: indexPath) as? DishesTVC else {
                return UITableViewCell()
            }
            return cell
        case .restro:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantsTVC", for: indexPath) as? RestaurantsTVC else {
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
            case .dishes:
                return 350
            default:
                return 190
            }
        }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        if offset > previousScrollOffset && offset > 0 {
            hideHeaderView()
        }
        else if offset < previousScrollOffset {
            showHeaderView()
        }

        previousScrollOffset = offset
    }
}

