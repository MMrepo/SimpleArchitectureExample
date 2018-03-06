//
//  Hero.swift
//  SimpleArchitectureExample
//
//  Created by Mateusz Małek on 06.03.2018.
//  Copyright © 2018 Mateusz Małek. All rights reserved.
//

import Foundation

public struct HeroViewModel {
  public let name: String
  public let description: String
  
  public init(name: String, description: String) {
    self.name = name
    self.description = description
  }
}

extension HeroViewModel: Equatable {
  public static func == (lhs: HeroViewModel, rhs: HeroViewModel) -> Bool {
    return lhs.name == rhs.name &&
      lhs.description == rhs.description
  }
}
