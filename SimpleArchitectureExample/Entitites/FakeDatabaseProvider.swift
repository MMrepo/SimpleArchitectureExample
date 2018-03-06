//
//  FakeDatabaseProvider.swift
//  SimpleArchitectureExample
//
//  Created by Mateusz Małek on 06.03.2018.
//  Copyright © 2018 Mateusz Małek. All rights reserved.
//

import Foundation

public class FakeDatabaseProvider {
  
  let heroes: [Hero]
  
  public init() {
    let shrek = Hero(uid: "1", name: "Shrek", description: "Green ogre")
    let donkey = Hero(uid: "2", name: "Donkey", description: "Stupid donkey")
    
    heroes = [shrek, donkey]
  }
}

extension FakeDatabaseProvider: HeroesUseCases {
  public func hero(atPosition position: Int) throws -> HeroViewModel {
    guard let hero = heroes[safe: position] else {
      throw "Couldn't find a hero at: \(position)"
    }
    
    return HeroViewModel(name: hero.name, description: hero.description)
  }
  
  public func allHeroes() throws -> [HeroViewModel] {
    return heroes.map({ HeroViewModel(name: $0.name, description: $0.description) })
  }
}
