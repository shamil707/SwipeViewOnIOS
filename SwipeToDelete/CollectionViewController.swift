//
//  CollectionViewController.swift
//  SwipeToDelete
//
//  Created by Alessandro Musto on 2/19/17.
//  Copyright © 2017 Lmusto. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CustomCell"

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var gameList = [
        "Foot Ball",
        "Cricket",
        "Hockey",
        "Rugby",
        "Chess",
        "Swimming",
        "BasketBall",
        "Carrom Board",
        "Foot Ball",
        "Cricket",
        "Hockey",
        "Rugby",
        "Chess",
        "Swimming",
        "BasketBall",
        "Carrom Board"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(UINib.init(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = CGSize(width: collectionView.bounds.width, height: 50)
        return itemSize
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameList.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCell
        cell.label.text = gameList[indexPath.row]
        return cell
    }
}
