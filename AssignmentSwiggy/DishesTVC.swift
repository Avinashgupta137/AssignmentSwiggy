//
//  DishesTVC.swift
//  AssignmentSwiggy
//
//  Created by suraj bhardwaj on 08/12/24.
//

import UIKit

class DishesTVC: UITableViewCell {

    @IBOutlet weak var dishCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        dishCollectionView.delegate = self
        dishCollectionView.dataSource = self
        dishCollectionView.register(UINib(nibName: "DishesCVC", bundle: nil), forCellWithReuseIdentifier: "DishesCVC")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
extension DishesTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 // Total number of items
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DishesCVC", for: indexPath) as? DishesCVC else {
            return UICollectionViewCell()
        }
        return cell
    }

    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfRows: CGFloat = 2
        let spacing: CGFloat = 20
        let totalSpacing = (numberOfRows - 1) * spacing
        let itemHeight = (collectionView.bounds.height - totalSpacing) / numberOfRows
        let itemWidth: CGFloat = 100
        return CGSize(width: itemWidth, height: itemHeight)
    }
}
