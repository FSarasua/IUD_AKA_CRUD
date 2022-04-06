//
//  UserDetailCollectionViewCell.swift
//  IUD_AKA_CRUD
//
//  Created by Francisco Javier Sarasua Galan on 21/3/22.
//

import UIKit

class UserDetailCollectionViewCell: UICollectionViewCell {
    
    // MARK: Outlet
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbBirthdate: UILabel!
    
    // MARK: Variable
    var data: UserViewModel!
    
    // MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: Public
    func loadCell() {
        lbName.text = data.name
        lbBirthdate.text = data.birthdate
    }
}
