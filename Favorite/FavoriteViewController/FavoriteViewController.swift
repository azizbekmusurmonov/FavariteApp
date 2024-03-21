//
//  CardViewController.swift
//  FavoriteView
//
//  Created by Azizbek Musurmonov   on 12/03/24.
//

import UIKit

enum MyCardType: Int, CaseIterable {
    case allCard
    case uzCard
    case humoCard
    case mpk
}

final class FavoriteViewController: UIViewController {
    
    private let cardView = CardView()
    private let presenter: CardPresenter
    
    init() {
        self.presenter = CardPresenter()
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
        view = cardView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardView.backgroundColor = .white
        cardView.collectionView.delegate = self
        cardView.collectionView.dataSource = self
        
        setUpNavigation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FavoriteViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfItemsIn(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        presenter.cellForItem(collectionView, at: indexPath)
    }
}

extension FavoriteViewController {
    
    private func setUpNavigation() {
        
        let searchButton = UIBarButtonItem(
            image: UIImage(systemName: "magnifyingglass"),
            style: .plain,
            target: self,
            action: #selector(searchBarButtonAction))
        
        navigationItem.rightBarButtonItems = [searchButton]
        searchButton.tintColor = .black
        navigationItem.title = "Favorites"
    }
    
    @objc private func searchBarButtonAction() {
        
    }
}
