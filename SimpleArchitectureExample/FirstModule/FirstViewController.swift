//
//  ExampleViewController.swift
//  SimpleArchitectureExample
//
//  Created by Mateusz Małek on 06.03.2018.
//  Copyright © 2018 Mateusz Małek. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
  
  private var flowCoordinator: ExampleFlowCoordinator!
  private var useCases: HeroesUseCases!
  private var tableView: UITableView!
  private var dataSource: TableViewDataSource!
  private var delegate: TableViewDelegate!
  
  func setup(withUseCases useCases: HeroesUseCases, flowCoordinator: ExampleFlowCoordinator) throws {
    self.useCases = useCases
    self.flowCoordinator = flowCoordinator
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView = UITableView()
    self.view.addSubview(tableView)
    self.view.centerAndSnapToBounds(tableView)
    self.dataSource = TableViewDataSource(useCases: useCases)
    self.delegate = TableViewDelegate(flowCoordinator: flowCoordinator, useCases: useCases)
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ExampleCell")
    tableView.dataSource = self.dataSource
    tableView.delegate = self.delegate
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
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
  
  private let flowCoordinator: ExampleFlowCoordinator
  private let useCases: HeroesUseCases

  init(flowCoordinator: ExampleFlowCoordinator, useCases: HeroesUseCases) {
    self.flowCoordinator = flowCoordinator
    self.useCases = useCases
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
    guard let hero = try? useCases.allHeroes()[indexPath.row] else {
      return
    }
    
    try? self.flowCoordinator.to(scene: .details(with: hero))
  }
}
