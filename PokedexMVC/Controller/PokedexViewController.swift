//
//  PokedexViewController.swift
//  PokedexMVC
//
//  Created by Vinícius Dalla Vechia on 25/05/23.
//

import UIKit

private let reuseIdentifier: String = "PokedexCell"

class PokedexViewController: UICollectionViewController {
  
  // MARK: - Properties
  
  var pokemon = [Pokemon]()
  
  // MARK: - Init
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViewComponents()
    fetchPokemon()
  }
  
  // MARK: - Selectors
  
  @objc func showSearchBar() {
    print("botao funcionando")
  }
  
  // MARK: - API
  
  func fetchPokemon() {
    Service.shared.fetchPokemon { (pokemon) in
      //necessário implementar esse dispatch pois o reloadData() tem que ser na mainThread
      DispatchQueue.main.async {
        self.pokemon = pokemon
        self.collectionView.reloadData()
      }
    }
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
    navigationController?.navigationBar.standardAppearance = appearance
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                        target: self,
                                                        action: #selector(showSearchBar))
    navigationItem.rightBarButtonItem?.tintColor = .white
    
    collectionView.register(PokedexCell.self, forCellWithReuseIdentifier: reuseIdentifier)
  }
}

extension PokedexViewController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return pokemon.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PokedexCell
    
    //dentro do array pokemon, pegue o pokemon na posicao zero e coloque na primeira célula da collection
    cell.pokemon = pokemon[indexPath.item]
    
    return cell
  }
}

extension PokedexViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 32, left: 8, bottom: 8, right: 8)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = (view.frame.width - 36)/3
    return CGSize(width: width, height: width)
  }

}
