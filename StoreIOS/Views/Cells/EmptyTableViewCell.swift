//
//  EmptyTableViewCell.swift
//  StoreIOS
//
//  Created by Daniel Klinkert Houfer on 10/18/17.
//  Copyright © 2017 Daniel Klinkert Houfer. All rights reserved.
//

import UIKit

class EmptyTableViewCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellSubtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureTitle(string:String) {
        
    }
    
    func configureSubtitle(string:String) {
        
    }
    
}
