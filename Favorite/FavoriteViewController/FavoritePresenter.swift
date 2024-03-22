//
//  CardPresenter.swift
//  FavoriteView
//
//  Created by Azizbek Musurmonov   on 12/03/24.
//

import UIKit

protocol FavoriteViewPresenterable: AnyObject {
    
    var model: FavoriteModel { get }
    
    func numberOfItemsIn(_ section: Int) -> Int
    
    func cellForItem(_ collectionView: UICollectionView, at indexPath: IndexPath
    ) -> UICollectionViewCell
}

final class CardPresenter: FavoriteViewPresenterable {
    
    var model: FavoriteModel = FavoriteModel(
        tag: [
            TagModel(id: 1, label: "Summer"),
            TagModel(id: 2, label: "T-Shirts"),
            TagModel(id: 3, label: "Shirts"),
            TagModel(id: 4, label: "Yana ")
        ],
        shop: [
            ShopModel(
                id: 1,
                imageUrl: "pic1",
                type: "&Berries",
                name: "T-Shirt",
                color: "Black",
                size: "S",
                sum: "10$"
            ),
            ShopModel(
                id: 2,
                imageUrl: "pic2",
                type: "Mango",
                name: "Longsleeve Violeta",
                color: "Orange",
                size: "S",
                sum: "46$"
            ),
            ShopModel(
                id: 3,
                imageUrl: "pic1",
                type: "&Berries",
                name: "T-Shirt",
                color: "Black",
                size: "S",
                sum: "10$"
            ),
            ShopModel(
                id: 4,
                imageUrl: "pic2",
                type: "Mango",
                name: "Longsleeve Violeta",
                color: "Orange",
                size: "S",
                sum: "46$"
            ),
            ShopModel(
                id: 5,
                imageUrl: "pic1",
                type: "&Berries",
                name: "T-Shirt",
                color: "Black",
                size: "S",
                sum: "10$"
            )
        ]
    )
    
    func numberOfItemsIn(_ section: Int) -> Int {
        guard let sectionType = SectionType(rawValue: section) else { return 0 }
        
        switch sectionType {
            
        case .tags:
            return model.tag.count
        case .shop:
            return model.shop.count
        }
    }
    
    func cellForItem(_ collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let sectionType = SectionType(rawValue: indexPath.section) else { return UICollectionViewCell()}
        
        switch sectionType {
            
        case .tags:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "tagCell",
                for: indexPath
            ) as? TagCell else {
                return UICollectionViewCell()
            }
            
            cell.prepare(data: model.tag[indexPath.row])
            
            return cell
            
        case .shop:
            
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "shopCell",
                for: indexPath
            ) as? ShopCell else {
                return UICollectionViewCell()
            }
            
            cell.prepare(data: model.shop[indexPath.row])
            
            return cell
        }
    }
}
