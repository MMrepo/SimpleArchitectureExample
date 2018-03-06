//
//  HeroView.swift
//  SimpleArchitectureExample
//
//  Created by Mateusz Małek on 06.03.2018.
//  Copyright © 2018 Mateusz Małek. All rights reserved.
//

import UIKit

class HeroView: UIView {
  private let title: TitleLabel
  public var name:String? {
    didSet {
      title.text = name
    }
  }
  
  init() {
    self.title = TitleLabel()
    super.init(frame: .zero)
    setupSubviews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension HeroView {
  func setupSubviews() {
    self.addSubview(title)
    title.translatesAutoresizingMaskIntoConstraints = false
    title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50).isActive = true
    title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50).isActive = true
    title.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    title.numberOfLines = 0
  }
}
