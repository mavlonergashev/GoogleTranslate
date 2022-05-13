//
//  TranslatorVC.swift
//  GoogleTranslate
//
//  Created by Mavlon on 12/05/22.
//

import UIKit
import SnapKit
import RealmSwift

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
        button.addTarget(nil, action: #selector(switchLangBtnPressed), for: .touchUpInside)
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
        textField.addTarget(nil, action: #selector(textFieldTextDidChange), for: .editingChanged)
        return textField
    }()
    let xBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        button.addTarget(nil, action: #selector(xBtnPressed), for: .touchUpInside)
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
        button.addTarget(nil, action: #selector(saveBtnPressed), for: .touchUpInside)
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
    var uzbekToEnglish = true
    var realm: Realm!
    var translateHistory: [TranslateHistory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        realm = try! Realm()
        fetchFromDataBase()
    }
    
    @objc func textFieldTextDidChange() {
//        translate(text: textField.text!, uzToEng: uzbekToEnglish)
    }
    
    @objc func xBtnPressed() {
        textField.text = ""
        textField.resignFirstResponder()
        xBtn.shake()
    }
    
    @objc func saveBtnPressed() {
        if textField.text! != "" || resultLabel.text! != "" {
            let history = TranslateHistory()
            history.text = textField.text! + " - " + resultLabel.text!
            translateHistory.append(history)
            writeToDataBase(history: history)
            self.tableView.reloadSections(IndexSet(integer: .zero), with: .automatic)
            saveBtn.scale(by: 1.2)
        }
    }
    
    @objc func switchLangBtnPressed() {
        uzbekToEnglish = !uzbekToEnglish
        updateUI()
        switchLangBtn.rotateBy180()
    }
}

//MARK: - Realm
extension TranslatorVC {
    func writeToDataBase(history: TranslateHistory) {
        try! realm.write({
            self.realm.add(history)
        })
    }
    
    func fetchFromDataBase() {
        translateHistory = realm.objects(TranslateHistory.self).compactMap {$0}
        self.tableView.reloadSections(IndexSet(integer: .zero), with: .automatic)
    }
    
    func removeFromDataBase(index: Int) {
        try! realm.write({
            self.realm.delete(translateHistory[index])
            self.translateHistory.remove(at: index)
            self.tableView.reloadSections(IndexSet(integer: .zero), with: .automatic)
        })
    }
}

//MARK: - Table View
extension TranslatorVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return translateHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.updateCell(text: translateHistory[indexPath.row].text!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Delete", handler: { _, _, _ in
            //Delete
            self.removeFromDataBase(index: indexPath.row)
        })])
    }
}

//MARK: - TextField Delegate
extension TranslatorVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

//MARK: - ConfigureUI
extension TranslatorVC {
    
    func updateUI() {
        if uzbekToEnglish {
            langFirstLabel.text = "Uzbek"
            translatorLabel.text = "Uzbek"
            langSecondLabel.text = "English"
            resultLangLabel.text = "English"
        } else {
            langFirstLabel.text = "English"
            translatorLabel.text = "English"
            langSecondLabel.text = "Uzbek"
            resultLangLabel.text = "Uzbek"
        }
    }
    
    func configureUI() {
        view.backgroundColor = #colorLiteral(red: 0.9333333373, green: 0.9333333373, blue: 0.9333333373, alpha: 1)
        
        textField.delegate = self
        
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

//MARK: - GetTranslatedText
extension TranslatorVC {
    
    func translate(text: String, uzToEng: Bool) {
        let headers = [
            "content-type": "application/x-www-form-urlencoded",
            "Accept-Encoding": "application/gzip",
            "X-RapidAPI-Host": "google-translate1.p.rapidapi.com",
            "X-RapidAPI-Key": "4c5777ce7amsh477ad4817315bf2p191555jsn28a7bba29229"
        ]
        let postData = NSMutableData(data: "q=\(text)".data(using: String.Encoding.utf8)!)
        
        if uzToEng {
            postData.append("&target=en".data(using: String.Encoding.utf8)!)
            postData.append("&source=uz".data(using: String.Encoding.utf8)!)
        } else {
            postData.append("&target=uz".data(using: String.Encoding.utf8)!)
            postData.append("&source=en".data(using: String.Encoding.utf8)!)
        }
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://google-translate1.p.rapidapi.com/language/translate/v2")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!.localizedDescription)
            } else {
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do {
                        let decodedData = try decoder.decode(TranslateDM.self, from: safeData)
                        let result = decodedData.data.translations.first?.translatedText
                        DispatchQueue.main.async {
                            self.resultLabel.text = result
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        })
        dataTask.resume()
    }
    
}
