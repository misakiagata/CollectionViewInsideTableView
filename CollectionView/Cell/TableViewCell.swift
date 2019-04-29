//
//  TableViewCell.swift
//  CollectionView
//
//  Created by 縣美早 on 2019/04/26.
//  Copyright © 2019 縣美早. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionViewOffset: CGFloat {
        get {
            return collectionView.contentOffset.x
        }
        
        set {
            collectionView.contentOffset.x = newValue
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let nib = UINib(nibName: "CollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "collectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    //delegateとdatasourceを使えるようにする。
    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {
        
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
        
        
    }
    
}
