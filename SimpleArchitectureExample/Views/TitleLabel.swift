//
//  TitleLabel.swift
//  SimpleArchitectureExample
//
//  Created by Mateusz Małek on 06.03.2018.
//  Copyright © 2018 Mateusz Małek. All rights reserved.
//

import UIKit

open class TitleLabel: UILabel {
  public init(translatesAutoresizingMaskIntoConstraints: Bool = false) {
    super.init(frame: .zero)
    self.translatesAutoresizingMaskIntoConstraints = false
  }
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension TitleLabel {
  public func set(theme: Theme) {
    self.textColor = theme.label.color
    self.font = theme.label.font
  }
}


