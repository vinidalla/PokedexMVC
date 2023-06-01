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
    
    navigationController?.navigationBar.barTintColor = .green
    navigationController?.navigationBar.barStyle = .black
    
    navigationItem.title = "Pokedex"
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                        target: self,
                                                        action: #selector(showSearchBar))
  }

}
