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
    return UIColor.rgb(red: 230, green: 30, blue: 30)
  }
}

extension UIView {
  func center(inView view: UIView) {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
  }
  
  func anchor(top: NSLayoutYAxisAnchor?,
              bottom: NSLayoutYAxisAnchor?,
              left: NSLayoutXAxisAnchor?,
              right: NSLayoutXAxisAnchor?,
              paddingTop: CGFloat,
              paddingBottom: CGFloat,
              paddingLeft: CGFloat,
              paddingRight: CGFloat,
              width: CGFloat,
              height: CGFloat) {
    translatesAutoresizingMaskIntoConstraints = false
    
    if let top = top {
      self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
    }
    
    if let bottom = bottom {
      bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
    }
    
    if let left = left {
      self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
    }
    
    if let right = right {
      rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
    }
    
    if width != 0 {
      widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    if height != 0 {
      heightAnchor.constraint(equalToConstant: height).isActive = true
    }
  }
}
