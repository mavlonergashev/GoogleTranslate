//
//  TranslatorVC.swift
//  GoogleTranslate
//
//  Created by Mavlon on 12/05/22.
//

import UIKit
import SnapKit

class TranslatorVC: UIViewController {

    let mainStackView = UIStackView()
    let headerView = UIView()
    let chooseLangView = UIView()
    let headerLabel = UILabel()
    let langFirstLabel = UILabel()
    let langSecondLabel = UILabel()
    let switchLangBtn = UIButton()
    let chooseLangStackView = UIStackView()
    let lineView = UIView()
    let translatorView = UIView()
    let translatorStackView = UIStackView()
    let translatorLabel = UILabel()
    let textField = UITextField()
    let xBtn = UIButton()
    let translatorSubStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.9333333373, green: 0.9333333373, blue: 0.9333333373, alpha: 1)
        
        //headerView
        headerView.backgroundColor = #colorLiteral(red: 0.2597777843, green: 0.5198658109, blue: 0.9554623961, alpha: 1)
        headerView.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
        
        //headerLabel
        headerLabel.text = "Google Translator"
        headerLabel.font = .systemFont(ofSize: 20)
        headerLabel.textColor = .white
        headerLabel.textAlignment = .center
        
        //mainStackView
        mainStackView.distribution = .fill
        mainStackView.alignment = .fill
        mainStackView.spacing = 0
        mainStackView.axis = .vertical
        
        //langFirstBtn
        langFirstLabel.text = "Uzbek"
        langFirstLabel.textColor = .tintColor
        
        //langSecondBtn
        langSecondLabel.text = "English"
        langSecondLabel.textColor = .tintColor
        
        //switchLangBtn
        switchLangBtn.setImage(UIImage(systemName: "arrow.left.arrow.right"), for: .normal)
        
        //chooseLangView
        chooseLangView.backgroundColor = .white
        
        //chooseLangStackView
        chooseLangStackView.axis = .horizontal
        chooseLangStackView.alignment = .fill
        chooseLangStackView.distribution = .equalSpacing
        
        //lineView
        lineView.backgroundColor = .lightGray
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        
        //translatorView
        translatorView.backgroundColor = .white
        
        //translatorStackView
        translatorStackView.distribution = .fill
        translatorStackView.alignment = .fill
        translatorStackView.axis = .vertical
        translatorStackView.spacing = 2
        
        //translatorLabel
        translatorLabel.text = "Uzbek"
        translatorLabel.textColor = .black
        translatorLabel.font = .systemFont(ofSize: 14)
        
        //xBtn
        xBtn.setImage(UIImage(systemName: "xmark"), for: .normal)
        xBtn.tintColor = .black
        
        //textField
        textField.placeholder = "Translate"
        textField.font = .systemFont(ofSize: 20)
        
        //translatorSubStackView
        translatorSubStackView.axis = .horizontal
        translatorSubStackView.alignment = .fill
        translatorSubStackView.distribution = .equalSpacing
        
        
        
        //translatorView Layout
        translatorSubStackView.addArrangedSubview(translatorLabel)
        translatorSubStackView.addArrangedSubview(xBtn)
        translatorStackView.addArrangedSubview(translatorSubStackView)
        translatorStackView.addArrangedSubview(textField)
        translatorView.addSubview(translatorStackView)
        translatorStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        
        //headerView Layout
        headerView.addSubview(headerLabel)
        headerLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        //chooseLangView Layout
        chooseLangStackView.addArrangedSubview(langFirstLabel)
        chooseLangStackView.addArrangedSubview(switchLangBtn)
        chooseLangStackView.addArrangedSubview(langSecondLabel)
        chooseLangView.addSubview(chooseLangStackView)
        chooseLangStackView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview().inset(10)
        }
        
        
        //mainStackView Layout
        mainStackView.addArrangedSubview(headerView)
        mainStackView.addArrangedSubview(chooseLangView)
        mainStackView.addArrangedSubview(lineView)
        mainStackView.addArrangedSubview(translatorView)
        
        view.addSubview(mainStackView)
        
        mainStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(40)
            make.left.right.equalToSuperview()
        }

    }

}
