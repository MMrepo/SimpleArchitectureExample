//
//  ThemeManager.swift
//  SimpleArchitectureExample
//
//  Created by Mateusz Małek on 06.03.2018.
//  Copyright © 2018 Mateusz Małek. All rights reserved.
//

import UIKit

public struct Theme {
  public struct Label {
    public var color: UIColor = UIColor(red: 87.0/255.0, green: 188.0/255.0, blue: 95.0/255.0, alpha: 1.0)
    public var font: UIFont = UIFont.systemFont(ofSize: 20)
  }
  
  public let label:Label
}

public final class ThemeManager {
  
  static let shared = ThemeManager()
  var currentStyle: Styles = .red
  
  enum Styles {
    case red
    case blue
  }
  
  func changeStyle() {
    currentStyle = currentStyle.opposite
    let titleLabel = TitleLabel.appearance()
    titleLabel.set(theme: currentStyle.theme)
    reloadViews()
  }
}

private extension ThemeManager {
  func reloadViews() {
    for window in UIApplication.shared.windows {
      for view in window.subviews {
        view.removeFromSuperview()
        window.addSubview(view)
      }
      window.rootViewController?.setNeedsStatusBarAppearanceUpdate()
    }
  }
}

extension ThemeManager.Styles {
  var theme: Theme {
    get {
      switch self {
      case .red:
        let labelStyle = Theme.Label(color: .red, font: .boldSystemFont(ofSize: 22))
        return Theme(label: labelStyle)
      case .blue:
        let labelStyle = Theme.Label(color: .blue, font: .systemFont(ofSize: 15))
        return Theme(label: labelStyle)
      }
    }
  }
  
  var opposite: ThemeManager.Styles {
    switch self {
    case .red:
      return .blue
    case .blue:
      return .red
    }
  }
}
