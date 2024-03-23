//
//  TableViewCell.swift
//  todoList
//
//  Created by t2023-m0074 on 3/22/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    // Todo완료 스위치작동코드 textLabel을 옵셔널체이닝으로 사용
    @IBAction func firstSwitch(_ sender: UISwitch) {
        if sender.isOn {
            textLabel?.attributedText = textLabel?.text?.strikeThrough()
        } else {
            textLabel?.attributedText = NSAttributedString(string: textLabel?.text ?? "")
            
        }
        
    }
    
    
}
