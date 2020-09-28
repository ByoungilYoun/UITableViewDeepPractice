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
  
  var twoDimensionalArray = [
    ExpandableNames(isExpanded: true, names: [ "Amy", "Jack", "Jimmy", "Steve", "Youn", "Karlo", "John"]),
    ExpandableNames(isExpanded: true, names: ["Carl", "Chris", "Christain", "Catalina"]),
    ExpandableNames(isExpanded: true, names:  [ "Dave", "Dan"]),
    ExpandableNames(isExpanded: true, names:  ["Patrick", "Patty"]),
  ]
  
  var showIndexPath = false
  
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
    tableView.register(ContactCell.self, forCellReuseIdentifier: cellId)
  }
  //MARK: - UITableViewDataSource
  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let button = UIButton(type: .system)
    button.setTitle("Close", for: .normal)
    button.backgroundColor = .yellow
    button.setTitleColor(.black, for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
    button.tag = section
    return button
  }
  
  override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 34
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return twoDimensionalArray.count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if !twoDimensionalArray[section].isExpanded {
      return 0 
    }
    return twoDimensionalArray[section].names.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    
    let name = twoDimensionalArray[indexPath.section].names[indexPath.row]
    cell.textLabel?.text = name
    
    if showIndexPath {
      cell.textLabel?.text = "\(name) Section : \(indexPath.section) Row : \(indexPath.row)"
    }
   
    return cell
  }
  
  //MARK: - @objc func
  @objc func handleShowIndexPath() {
    // build all the indexPaths we want to reload
    var indexPathsToReload = [IndexPath]()
   
    for section in twoDimensionalArray.indices {
      for row in twoDimensionalArray[section].names.indices {
        print(section, row)
        let indexPath = IndexPath(row: row, section: section)
        indexPathsToReload.append(indexPath)
      }
    }
    
    showIndexPath = !showIndexPath
    
    let animationStyle = showIndexPath ? UITableView.RowAnimation.right : .left
    
    tableView.reloadRows(at: indexPathsToReload, with: animationStyle)
  }
  
  @objc func handleExpandClose(button : UIButton) {
    // try to close the section first by deleting the rows
    
    let section = button.tag
    var indexPaths = [IndexPath]()
    
    for row in twoDimensionalArray[section].names.indices {
      let indexPath = IndexPath(row: row, section: section)
      indexPaths.append(indexPath)
    }
    
    
    let isExpanded = twoDimensionalArray[section].isExpanded
    twoDimensionalArray[section].isExpanded = !isExpanded
    
    button.setTitle(isExpanded ? "Open" : "Close" , for: .normal)
    
    if isExpanded {
      tableView.deleteRows(at: indexPaths, with: .fade)
    } else {
      tableView.insertRows(at: indexPaths, with: .fade)
    }
  }
}

