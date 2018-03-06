//
//  SecondViewController.swift
//  SimpleArchitectureExample
//
//  Created by Mateusz Małek on 06.03.2018.
//  Copyright © 2018 Mateusz Małek. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  private let heroView = HeroView()
  private let presenter = SecondViewPresenter() // Maybe presenter should be injected here?
  
  func setup(with hero: Hero) throws {
    self.heroView.name = try? presenter.songLyricFor(hero: hero)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.addSubview(heroView)
    self.view.centerAndSnapToBounds(heroView)
  }
}

protocol DetailPresenter {
  func songLyricFor(hero: Hero) throws -> String
}

extension DetailPresenter {
  func songLyricFor(hero: Hero) throws -> String {
    return "I need a hero (which is \(hero.name)), I'm holding out for a hero 'til the end of the night"
  }
}

class SecondViewPresenter: DetailPresenter {
  
}
