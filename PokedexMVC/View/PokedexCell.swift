//
//  PokedexCell.swift
//  PokedexMVC
//
//  Created by Vinícius Dalla Vechia on 21/06/23.
//

import UIKit

class PokedexCell: UICollectionViewCell {
  
  // MARK: - Properties
  
  var pokemon: Pokemon? {
    didSet {
      nameLabel.text = pokemon?.name
      imageView.image = pokemon?.image
    }
  }
  
  let imageView: UIImageView = {
    let iv = UIImageView()
    iv.backgroundColor = .systemGroupedBackground
    iv.contentMode = .scaleAspectFit
    return iv
  }()
  lazy var nameContainerView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.mainColor()
    view.addSubview(nameLabel)
    nameLabel.center(inView: view)
    return view
  }()
  let nameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = UIFont.boldSystemFont(ofSize: 17)
    return label
  }()
  // MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureViewComponents()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Selectors

  @objc func handleLongPress() {
    print("long press pressed!")
  }
  
  // MARK: - Helper Functions
  
  func configureViewComponents() {
    self.layer.cornerRadius = 10
    self.clipsToBounds = true
    
    addSubview(imageView)
    imageView.anchor(top: topAnchor,
                     bottom: nil,
                     left: leftAnchor,
                     right: rightAnchor,
                     paddingTop: 0,
                     paddingBottom: 0,
                     paddingLeft: 0,
                     paddingRight: 0,
                     width: 0,
                     height: self.frame.height - 32)
    
    addSubview(nameContainerView)
    nameContainerView.anchor(top: nil,
                             bottom: bottomAnchor,
                             left: leftAnchor,
                             right: rightAnchor,
                             paddingTop: 0,
                             paddingBottom: 0,
                             paddingLeft: 0,
                             paddingRight: 0,
                             width: 0,
                             height: 32)
    
    let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self,
                                                                  action: #selector(handleLongPress))
    self.addGestureRecognizer(longPressGestureRecognizer)
  }
}
