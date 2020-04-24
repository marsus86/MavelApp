//
//  ViewTableViewCell.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 16/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import UIKit

protocol CustomViewTableViewCellDelegate: class {
    func showViewDetail(idCharacter: Int)
}

class CustomViewTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var labelCell: UILabel!
    @IBOutlet weak var btnCharacterDetail: UIButton!

    private weak var delegate: CustomViewTableViewCellDelegate?
    
    var characterId: ListCharacter?
    var idCharacter: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bind(delegate: CustomViewTableViewCellDelegate, idCharacter: Int) {
        self.delegate = delegate
        self.idCharacter = idCharacter
    }

    @IBAction func showDetailCharacter(_ sender: Any) {
        if let d = delegate {
            d.showViewDetail(idCharacter: idCharacter!)
        }
    }
}
