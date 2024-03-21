//
//  CardViewCell.swift
//  FavoriteView
//
//  Created by Azizbek Musurmonov   on 13/03/24.
//

import UIKit

final class FavoriteViewCell: UICollectionViewCell {
    
    private let bankName = UILabel()
    private let bankLogo = UIImageView()
    private let cellView = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
//    func prepare(data: ShopModel) {
//        self.imageView.image = UIImage(named: data.imageUrl)
//        //self.imageView.downloaded(from: data.imageUrl)
//        self.shopNameLabel.text = data.shopNameLabel
//        self.contentLabel.text = data.contentLabel
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
