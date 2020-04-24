//
//  DetailViewController.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 22/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import Foundation
import UIKit

protocol DetailViewTableViewCellDelegate: class {
}

class DetailViewTableViewCell: UITableViewCell {

    @IBOutlet weak var lbStory: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
