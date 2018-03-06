//
//  Hero.swift
//  SimpleArchitectureExample
//
//  Created by Mateusz Małek on 06.03.2018.
//  Copyright © 2018 Mateusz Małek. All rights reserved.
//

import Foundation

public struct Hero {
  public let uid: String
  public let name: String
  public let description: String
  public let createdAt: Date
  
  public init(uid: String, name: String, description: String) {
    self.uid = uid
    self.name = name
    self.description = description
    self.createdAt = Date()
  }
}

extension Hero: Equatable {
  public static func ==(lhs: Hero, rhs: Hero) -> Bool {
    return lhs.uid == rhs.uid &&
      lhs.name == rhs.name &&
      lhs.createdAt == rhs.createdAt &&
      lhs.description == rhs.description
  }
}
