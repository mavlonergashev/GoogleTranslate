//
//  TranslatorVC.swift
//  GoogleTranslate
//
//  Created by Mavlon on 12/05/22.
//

import UIKit
import SnapKit

class TranslatorVC: UIViewController {
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.axis = .vertical
        return stackView
    }()
    let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2597777843, green: 0.5198658109, blue: 0.9554623961, alpha: 1)
        view.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
        return view
    }()
    let chooseLangView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    let headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.text = "Google Translator"
        headerLabel.font = .systemFont(ofSize: 20)
        headerLabel.textColor = .white
        headerLabel.textAlignment = .center
        return headerLabel
    }()
    let langFirstLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Uzbek"
        lbl.textColor = .tintColor
        return lbl
    }()
    let langSecondLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "English"
        lbl.textColor = .tintColor
        return lbl
    }()
    let switchLangBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.left.arrow.right"), for: .normal)
        return button
    }()
    let chooseLangStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        return stackView
    }()
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        return view
    }()
    let translatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    let translatorStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 2
        return stackView
    }()
    let translatorLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Uzbek"
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 14)
        return lbl
    }()
    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Translate"
        textField.font = .systemFont(ofSize: 20)
        return textField
    }()
    let xBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        return button
    }()
    let translatorSubStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        return stackView
    }()
    let resultView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    let resultContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2597777843, green: 0.5198658109, blue: 0.9554623961, alpha: 1)
        view.clipsToBounds = true
        view.layer.cornerRadius = 2
        return view
    }()
    let resultLangLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "English"
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 14)
        return lbl
    }()
    let resultLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 20)
        lbl.numberOfLines = 0
        lbl.text = ""
        return lbl
    }()
    let saveBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.tintColor = .white
        return button
    }()
    let resultStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }()
    let resultSubStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        return stackView
    }()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

//MARK: - Table View
extension TranslatorVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.updateCell(text: "Hello, how are you? - Salom, qandaysiz?")
        return cell
    }
}

//MARK: - ConfigureUI
extension TranslatorVC {
    func configureUI() {
        view.backgroundColor = #colorLiteral(red: 0.9333333373, green: 0.9333333373, blue: 0.9333333373, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = .clear
        
        //resultView Layout
        resultSubStackView.addArrangedSubview(resultLangLabel)
        resultSubStackView.addArrangedSubview(saveBtn)
        resultStackView.addArrangedSubview(resultSubStackView)
        resultStackView.addArrangedSubview(resultLabel)
        resultContainerView.addSubview(resultStackView)
        resultStackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().inset(8)
        }
        resultView.addSubview(resultContainerView)
        resultContainerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(8)
            make.top.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
        
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
        mainStackView.addArrangedSubview(resultView)
        
        view.addSubview(mainStackView)
        view.addSubview(tableView)
        
        mainStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(40)
            make.left.right.equalToSuperview()
        }
        
        //tableView Layout
        tableView.snp.makeConstraints { make in
            make.top.equalTo(mainStackView.snp.bottom).offset(10)
            make.right.left.bottom.equalToSuperview()
        }
    }
}
