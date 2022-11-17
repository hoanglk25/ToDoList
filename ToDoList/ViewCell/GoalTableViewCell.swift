//
//  GoalTableViewCell.swift
//  ToDoList
//
//  Created by Hoàng Đức on 16/11/2022.
//

import UIKit

class GoalTableViewCell: UITableViewCell {

    @IBOutlet weak var goalLabel: UILabel!
    
    @IBOutlet weak var goalTerm: UILabel!
    
    @IBOutlet weak var dayLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
