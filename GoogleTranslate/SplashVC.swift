//
//  SplashVC.swift
//  GoogleTranslate
//
//  Created by Mavlon on 13/05/22.
//

import UIKit
import SnapKit

class SplashVC: UIViewController {

    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            let vc = TranslatorVC()
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func configureUI() {
        view.backgroundColor = #colorLiteral(red: 0.2597777843, green: 0.5198658109, blue: 0.9554623961, alpha: 0.8506312086)
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.width.equalTo(self.view.snp.width).multipliedBy(0.5)
            make.height.equalTo(logoImageView.snp.width)
            make.centerWithinMargins.equalTo(self.view.snp.centerWithinMargins)
        }
    }
}
