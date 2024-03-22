//
//  CardViewCell.swift
//  FavoriteView
//
//  Created by Azizbek Musurmonov   on 13/03/24.
//

import UIKit

final class TagCell: UICollectionViewCell {
    
    private let cellView = UIView()
    private let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(cellView)
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                          constant: 0).isActive = true
        cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                           constant: 0).isActive = true
        cellView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                      constant: 0).isActive = true
        cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                         constant: 0).isActive = true
        cellView.layer.cornerRadius = 16
        cellView.backgroundColor = .rgb(34, 34, 34)
        
        cellView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: cellView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .white
    }
    
    func prepare(data: TagModel) {
        self.label.text = data.label
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
