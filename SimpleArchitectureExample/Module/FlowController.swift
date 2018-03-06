//
//  FlowCoordinator.swift
//  SimpleArchitectureExample
//
//  Created by Mateusz Małek on 06.03.2018.
//  Copyright © 2018 Mateusz Małek. All rights reserved.
//

import Foundation


public protocol FlowController {
  associatedtype SceneType
  func to(scene: SceneType, withAnimation animation: Bool) throws
}
