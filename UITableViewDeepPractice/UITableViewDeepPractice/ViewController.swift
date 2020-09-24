//
//  ViewController.swift
//  UITableViewDeepPractice
//
//  Created by 윤병일 on 2020/09/24.
//

import UIKit

class ViewController: UITableViewController {
  //MARK: - Properties
  
  let cellId = "cellId"
  
  let twoDimensionalArray = [
    [ "Amy", "Jack", "Jimmy", "Steve", "Youn", "Karlo", "John"],
    ["Carl", "Chris", "Christain", "Catalina"],
    [ "Dave", "Dan"],
    ["Patrick", "Patty"]
  ]
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setNavi()
    setUI()
  }

  //MARK: - setNavi()
  private func setNavi() {
    navigationItem.title = "Contacts"
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show IndexPath", style: .plain, target: self, action: #selector(handleShowIndexPath))


  }
  
  //MARK: - setUI()
  private func setUI() {
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
  }
  //MARK: - UITableViewDataSource
  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let label = UILabel()
    label.text = "Header"
    label.backgroundColor = UIColor.lightGray
    return label
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return twoDimensionalArray.count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return twoDimensionalArray[section].count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    
    let name = twoDimensionalArray[indexPath.section][indexPath.row]
    cell.textLabel?.text = name
    cell.textLabel?.text = "\(name) Section : \(indexPath.section) Row : \(indexPath.row)"
    return cell
  }
  
  //MARK: - @objc func
  @objc func handleShowIndexPath() {
    let indexPath = IndexPath(row: 0, section: 0)
    tableView.reloadRows(at: [indexPath], with: .left)
  }
}
