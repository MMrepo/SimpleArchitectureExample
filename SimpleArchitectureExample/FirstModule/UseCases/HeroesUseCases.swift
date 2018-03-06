//
//  HeroesUseCases.swift
//  SimpleArchitectureExample
//
//  Created by Mateusz Małek on 06.03.2018.
//  Copyright © 2018 Mateusz Małek. All rights reserved.
//

import Foundation

public protocol HeroesUseCases {  // UseCase can be a separate abstraction, or any service like database can conform to UseCase and provide what is needed
  func hero(atPosition position: Int) throws -> HeroViewModel
  func allHeroes() throws -> [HeroViewModel]
}
