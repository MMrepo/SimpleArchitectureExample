//
//  UIView+Utils.swift
//  SimpleArchitectureExample
//
//  Created by Mateusz Małek on 06.03.2018.
//  Copyright © 2018 Mateusz Małek. All rights reserved.
//

import UIKit

public extension UIView {
  func centerAndSnapToBounds(_ subView: UIView) {
    subView.translatesAutoresizingMaskIntoConstraints = false
    subView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    subView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    subView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
    subView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
  }
}
