//
//  ExampleFlowController.swift
//  SimpleArchitectureExample
//
//  Created by Mateusz Małek on 06.03.2018.
//  Copyright © 2018 Mateusz Małek. All rights reserved.
//

import UIKit

// There should be only one FlowController per module

public final class ExampleFlowController {
  public enum Scene {
    case start
    case details(with:HeroViewModel)
    case previous
  }
  
  private let navigationController: UINavigationController?
  private let useCases: HeroesUseCases
  
  public init(useCases: HeroesUseCases, navigationController: UINavigationController? = nil) {
    self.navigationController = navigationController
    self.useCases = useCases
  }
}

extension ExampleFlowController: FlowController {
  public typealias SceneType = Scene

  public func to(scene: Scene, withAnimation animation: Bool = true) throws {
    switch scene {
    case .start:
      guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstViewController") as? FirstViewController else {
        throw "FirstViewController can't be instantiated"
      }
      try? viewController.setup(withUseCases: self.useCases, FlowController: self)
      navigationController?.pushViewController(viewController, animated: animation)
      
    case .details(with: let hero):
      guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? DetailViewController else {
        throw "SecondViewController can't be instantiated"
      }
      try? viewController.setup(with: hero)
      navigationController?.pushViewController(viewController, animated: animation)
      
    case .previous:
      navigationController?.popViewController(animated: animation)
    }
  }
}
