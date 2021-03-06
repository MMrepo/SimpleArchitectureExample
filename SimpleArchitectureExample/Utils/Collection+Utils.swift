//
//  Collection+Utils.swift
//  SimpleArchitectureExample
//
//  Created by Mateusz Małek on 06.03.2018.
//  Copyright © 2018 Mateusz Małek. All rights reserved.
//

import Foundation

extension Collection {
  subscript (safe index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
}
