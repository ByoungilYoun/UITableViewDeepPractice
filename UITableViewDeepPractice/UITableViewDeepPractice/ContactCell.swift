//
//  ContactCell.swift
//  UITableViewDeepPractice
//
//  Created by 윤병일 on 2020/09/28.
//

import UIKit

class ContactCell : UITableViewCell {
  
  //MARK: - Properties
  let checkButton : UIButton = {
    let bt = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    bt.setImage(UIImage(systemName: "circle"), for: .normal)
    bt.tintColor = .lightGray
//    bt.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
    return bt
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
//    let checkButton = UIButton(type: .system)
//    checkButton.setImage(UIImage(systemName: "circle"), for: .normal)
//    checkButton.tintColor = .lightGray
    checkButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
    checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
    accessoryView = checkButton
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc private func checkButtonTapped() {
    print("12")
  }
}
