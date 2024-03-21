//
//  CardView.swift
//  FavoriteView
//
//  Created by Azizbek Musurmonov   on 12/03/24.
//

import UIKit

final class CardView: UIView {
        
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(FavoriteViewCell.self, forCellWithReuseIdentifier: "favoriteViewCell")
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { (
            sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment
        ) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(140),
                                                   heightDimension: .absolute(80))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 10
            section.orthogonalScrollingBehavior = .continuous
//            section.contentInsets = .init(top: 10, leading: 10, bottom: 40, trailing: 10)
            
//            let supplementarySize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
//                                                           heightDimension: .absolute(40))
            return section
        }
    }
    
    private func setUpCollectionView() {
        
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @objc private func segmentedControlChanged(_ sender: UISegmentedControl) {
        guard let itemType = MyCardType(rawValue: sender.selectedSegmentIndex) else { return }
        
        switch itemType {
        case .allCard:
            print("All card")
        case .uzCard:
            print("select uzcard")
        case .humoCard:
            print("select humoCard")
        case .mpk:
            print("select mpk")
        }
    }
}
