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
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.backgroundColor = .systemGray5
        return view
    }()
    let txtLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 15)
        return lbl
    }()
        
    func configureUI() {
        contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        contentView.addSubview(clearView)
        clearView.addSubview(containerView)
        containerView.addSubview(txtLabel)
        
        clearView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        containerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(8)
            make.top.bottom.equalToSuperview().inset(4)
        }
        txtLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.left.right.equalToSuperview().inset(8)
        }
    }
    
    func updateCell(text: String) {
        configureUI()
        txtLabel.text = text
    }
    
}
