//
//  CustomCell.swift
//  GoogleTranslate
//
//  Created by Mavlon on 12/05/22.
//

import UIKit
import SnapKit

class CustomCell: UITableViewCell {
    
    static let identifierCell = "cell"
    let clearView = UIView()
    let containerView = UIView()
    let txtLabel = UILabel()
        

    func setUI() {
        contentView.addSubview(clearView)
        
    }
}
