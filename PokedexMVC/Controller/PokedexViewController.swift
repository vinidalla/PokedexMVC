//
//  PokedexViewController.swift
//  PokedexMVC
//
//  Created by Vinícius Dalla Vechia on 25/05/23.
//

import UIKit

class PokedexViewController: UICollectionViewController {
  
  // MARK: - Properties
  
  // MARK: - Init
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViewComponents()
  }
  
  // MARK: - Selectors
  
  @objc func showSearchBar() {
    print("botao funcionando")
  }

  
  // MARK: - Helper Functions
  
  func configureViewComponents() {
    collectionView?.backgroundColor = .white
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = UIColor.mainColor()
    let titleAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor.white]
    
    navigationItem.title = "Pokedex"
    
    appearance.titleTextAttributes = titleAttribute
    navigationController?.navigationBar.isTranslucent = false
    navigationController?.navigationBar.scrollEdgeAppearance = appearance
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                        target: self,
                                                        action: #selector(showSearchBar))
    navigationItem.rightBarButtonItem?.tintColor = .white
  }

}
