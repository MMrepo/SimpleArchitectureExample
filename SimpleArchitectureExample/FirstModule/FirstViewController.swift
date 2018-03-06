//
//  ExampleViewController.swift
//  SimpleArchitectureExample
//
//  Created by Mateusz Małek on 06.03.2018.
//  Copyright © 2018 Mateusz Małek. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
  
  private var FlowController: ExampleFlowController!
  private var useCases: HeroesUseCases!
  private var tableView: UITableView!
  private var dataSource: TableViewDataSource!
  private var delegate: TableViewDelegate!
  
  func setup(withUseCases useCases: HeroesUseCases, FlowController: ExampleFlowController) throws {
    self.useCases = useCases
    self.FlowController = FlowController
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.tableView = UITableView()
    self.view.addSubview(tableView)
    self.view.centerAndSnapToBounds(tableView)
    self.dataSource = TableViewDataSource(useCases: useCases)
    self.delegate = TableViewDelegate(FlowController: FlowController, useCases: useCases)
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ExampleCell")
    tableView.dataSource = self.dataSource
    tableView.delegate = self.delegate
  }
}

private class TableViewDataSource: NSObject, UITableViewDataSource {
  
  private let useCases: HeroesUseCases
  
  init(useCases: HeroesUseCases) {
    self.useCases = useCases
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return (try? useCases.allHeroes().count) ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ExampleCell", for: indexPath)
    let hero = try? useCases.allHeroes()[indexPath.row]
    cell.textLabel?.text = hero?.name
    return cell
  }
}

private class TableViewDelegate: NSObject, UITableViewDelegate {
  
  private let FlowController: ExampleFlowController
  private let useCases: HeroesUseCases

  init(FlowController: ExampleFlowController, useCases: HeroesUseCases) {
    self.FlowController = FlowController
    self.useCases = useCases
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
    guard let hero = try? useCases.allHeroes()[indexPath.row] else {
      return
    }
    
    try? self.FlowController.to(scene: .details(with: hero))
  }
}
