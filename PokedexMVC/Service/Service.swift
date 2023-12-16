//
//  Service.swift
//  PokedexMVC
//
//  Created by Vinícius Dalla Vechia on 23/06/23.
//

import UIKit

class Service {
  
  static let shared = Service()
  let BASE_URL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
  
  func fetchPokemon(completion: @escaping ([Pokemon]) -> ()) {
    var pokemonArray = [Pokemon]()

    guard let url = URL(string: BASE_URL) else { return }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      
      //handle error
      if let error = error {
        print("Failed to fetch data with error: ", error.localizedDescription)
        return
      }
      
      guard let data = data else { return }
      
      do { //JSON do objeto da internet e digo pro xcode que quero que ele seja um array de qualquer tipo [AnyObject]
        guard let resultArray = try JSONSerialization.jsonObject(with: data, options: []) as? [AnyObject] else { return }
        
        for (key, result) in resultArray.enumerated() {
          if let dictionary = result as? [String: AnyObject] {
            let pokemon = Pokemon(id: key, dictionary: dictionary)
            
            guard let imageUrl = pokemon.imageUrl else { return }
            
            self.fetchImage(withUrlString: imageUrl) { image in
              pokemon.image = image
              pokemonArray.append(pokemon) //povoando o array de pokemons
              
              pokemonArray.sort { poke1, poke2 in //ordenando os pokemons pelo id correto
                return poke1.id ?? 0 < poke2.id ?? 0
              }
              
// TODO: - CRIAR CAMADA DE SERVICE USANDO JSON DECODER COM INJECAO DE DEPENDENCIA

              completion(pokemonArray)
            }
          }
        }
      } catch let error {
        print("Failed to create json with error: ", error.localizedDescription)
      }
    }.resume() //caso nao consiga concluir a call pela URL, esse .resume() volta e tenta de novo
  }
  
  private func fetchImage(withUrlString urlString: String, completion: @escaping(UIImage) -> ()) {
    guard let url = URL(string: urlString) else { return }
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let error = error {
        print("Failed to fetch image with error: ", error.localizedDescription)
        return
      }
      
      guard let data = data else { return }
      guard let image =  UIImage(data: data) else { return }
      completion(image)
    }.resume()
  }
}
