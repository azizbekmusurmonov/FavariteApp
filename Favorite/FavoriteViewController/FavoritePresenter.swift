//
//  CardPresenter.swift
//  FavoriteView
//
//  Created by Azizbek Musurmonov   on 12/03/24.
//

import UIKit

protocol CardViewPresenterable: AnyObject {
    
    func numberOfItemsIn(_ section: Int) -> Int
    
    func cellForItem(_ collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell
}

final class CardPresenter: CardViewPresenterable {
    func numberOfItemsIn(_ section: Int) -> Int {
        10
    }
    
    func cellForItem(_ collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "favoriteViewCell",
            for: indexPath
        ) as? FavoriteViewCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .red
        
        return cell
    }
}
