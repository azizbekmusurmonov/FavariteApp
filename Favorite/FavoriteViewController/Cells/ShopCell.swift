//
//  ShopCell.swift
//  Favorite
//
//  Created by Azizbek Musurmonov   on 21/03/24.
//

import UIKit

final class ShopCell: UICollectionViewCell {
    
    private let cellView = UIView()
    private let imageView = UIImageView()
    private let typeName = UILabel()
    private let imageName = UILabel()
    private let colorName = UILabel()
    private let sizeName = UILabel()
    private let sum = UILabel()
    private let xButton = UIButton(type: .system)
    private let starsButton = UIButton(type: .system)
    private let busketButton = UIButton(type: .system)
    private let color = UILabel()
    private let size = UILabel()
    
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
        cellView.layer.cornerRadius = 10
        cellView.backgroundColor = .systemGray6
        
        cellView.addSubview(imageView)
        cellView.addSubview(typeName)
        cellView.addSubview(imageName)
        cellView.addSubview(colorName)
        cellView.addSubview(sizeName)
        cellView.addSubview(sum)
        imageView.addSubview(xButton)
        cellView.addSubview(starsButton)
        cellView.addSubview(busketButton)
        cellView.addSubview(color)
        cellView.addSubview(size)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: cellView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -100).isActive = true
        imageView.layer.cornerRadius = 10
        
        busketButton.translatesAutoresizingMaskIntoConstraints = false
        busketButton.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10).isActive = true
        busketButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -20).isActive = true
        busketButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        busketButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        busketButton.backgroundColor = .red
        busketButton.setImage(UIImage(systemName: "handbag.fill"), for: .normal)
        busketButton.addTarget(self, action: #selector(busketButtonTapped), for: .touchUpInside)
        busketButton.tintColor = .white
        busketButton.layer.cornerRadius = 24
    
        starsButton.translatesAutoresizingMaskIntoConstraints = false
        starsButton.leadingAnchor.constraint(equalTo: cellView.leadingAnchor).isActive = true
        starsButton.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        starsButton.setImage(UIImage(named: "Star"), for: .normal)
        
        xButton.translatesAutoresizingMaskIntoConstraints = false
        xButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 5).isActive = true
        xButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -5).isActive = true
        xButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        xButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        xButton.setImage(UIImage(systemName: "x.circle"), for: .normal)
        xButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        xButton.tintColor = .black
        
        typeName.translatesAutoresizingMaskIntoConstraints = false
        typeName.leadingAnchor.constraint(equalTo: cellView.leadingAnchor).isActive = true
        typeName.topAnchor.constraint(equalTo: starsButton.bottomAnchor).isActive = true
        typeName.font = .systemFont(ofSize: 11)
        typeName.textColor = .rgb(145, 145, 145)
        
        imageName.translatesAutoresizingMaskIntoConstraints = false
        imageName.leadingAnchor.constraint(equalTo: cellView.leadingAnchor).isActive = true
        imageName.topAnchor.constraint(equalTo: typeName.bottomAnchor).isActive = true
        imageName.font = .boldSystemFont(ofSize: 15)
        
        color.translatesAutoresizingMaskIntoConstraints = false
        color.leadingAnchor.constraint(equalTo: cellView.leadingAnchor).isActive = true
        color.bottomAnchor.constraint(equalTo: sum.topAnchor).isActive = true
        color.text = "Color: "
        color.font = .systemFont(ofSize: 11)
        color.textColor = .rgb(145, 145, 145)
        
        colorName.translatesAutoresizingMaskIntoConstraints = false
        colorName.leadingAnchor.constraint(equalTo: color.trailingAnchor).isActive = true
        colorName.bottomAnchor.constraint(equalTo: sum.topAnchor).isActive = true
        colorName.font = .systemFont(ofSize: 11)
        colorName.textColor = .rgb(137, 137, 137)
        
        size.translatesAutoresizingMaskIntoConstraints = false
        size.leadingAnchor.constraint(equalTo: colorName.trailingAnchor, constant: 20).isActive = true
        size.bottomAnchor.constraint(equalTo: sum.topAnchor).isActive = true
        size.font = .systemFont(ofSize: 11)
        size.text = "Size: "
        size.textColor = .rgb(145, 145, 145)
        
        sizeName.translatesAutoresizingMaskIntoConstraints = false
        sizeName.leadingAnchor.constraint(equalTo: size.trailingAnchor).isActive = true
        sizeName.bottomAnchor.constraint(equalTo: sum.topAnchor).isActive = true
        sizeName.font = .systemFont(ofSize: 11)
        sizeName.textColor = .rgb(137, 137, 137)
        
        sum.translatesAutoresizingMaskIntoConstraints = false
        sum.leadingAnchor.constraint(equalTo: cellView.leadingAnchor).isActive = true
        sum.topAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -30).isActive = true
    }
    
    func prepare(data: ShopModel) {
        self.imageView.image = UIImage(named: data.imageUrl)
        self.typeName.text = data.type
        self.imageName.text = data.name
        self.colorName.text = data.color
        self.sizeName.text = data.size
        self.sum.text = data.sum
    }
    
    @objc func buttonTapped() {
        
    }
    
    @objc func busketButtonTapped() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
