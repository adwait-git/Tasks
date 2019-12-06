//
//  InfoTableViewCell.swift
//  FMDBDatabase Demo
//
//  Created by Parth Changela on 22/06/17.
//  Copyright © 2017 Micropple. All rights reserved.
//

import UIKit
protocol buttonDeleget {

    func EditButton(sender:InfoTableViewCell)
    func DeleteButton(sender:InfoTableViewCell)

}

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblMobileNo: UILabel!
    @IBOutlet weak var lblEmail: UILabel!

    var editData:buttonDeleget?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func btnEditTapped(_ sender: Any) {
        self.editData?.EditButton(sender: self)
    }

    @IBAction func btnDeleteTapped(_ sender: Any) {
        self.editData?.DeleteButton(sender: self)
    }

}
