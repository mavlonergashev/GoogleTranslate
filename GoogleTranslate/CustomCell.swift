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
    let clearView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5.withAlphaComponent(0.7)
        return view
    }()
    let txtLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        return lbl
    }()
        
    func configureUI() {
        contentView.addSubview(clearView)
        clearView.addSubview(containerView)
        
        clearView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        containerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().inset(8)
        }
    }
    
    func updateCell(text: String) {
        configureUI()
        txtLabel.text = text
    }
    
}
