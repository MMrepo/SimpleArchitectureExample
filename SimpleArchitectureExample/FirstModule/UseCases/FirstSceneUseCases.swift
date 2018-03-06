//
//  FirstSceneUseCases.swift
//  SimpleArchitectureExample
//
//  Created by Mateusz Małek on 06.03.2018.
//  Copyright © 2018 Mateusz Małek. All rights reserved.
//

import Foundation

public protocol HeroesUseCases {
  func hero(withId id: String) throws -> Hero
  func allHeroes() throws -> [Hero]
}

public class FirstSceneUseCases: HeroesUseCases {
  
  let heroes: [Hero]
  
  public init() {
    let shrek = Hero(uid: "1", name: "Shrek", description: "Green ogre")
    let donkey = Hero(uid: "2", name: "Donkey", description: "Stupid donkey")

    heroes = [shrek, donkey]
  }
  
  public func hero(withId id: String) throws -> Hero {
    guard let hero = heroes.filter({ $0.uid == id }).first else {
      throw "Couldn't find a hero with id: \(id)"
    }
    return hero
  }
  
  public func allHeroes() throws -> [Hero] {
    return heroes
  }
}

