//
//  Extensions.swift
//  PokedexMVC
//
//  Created by Vinícius Dalla Vechia on 01/06/23.
//

import UIKit

extension UIColor {
  
  static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 0.5)
  }
  
  static func mainColor() -> UIColor {
    return UIColor.rgb(red: 5, green: 5, blue: 5)
  }
}

