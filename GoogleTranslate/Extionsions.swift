//
//  Extionsions.swift
//  GoogleTranslate
//
//  Created by Mavlon on 13/05/22.
//

import Foundation
import UIKit

extension UIView {
    func rotateBy180() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1.1, initialSpringVelocity: 0.9, options: .curveEaseInOut) {
            self.transform = CGAffineTransform(rotationAngle: .pi)
        } completion: { _ in
            self.transform = .identity
        }
    }
    
    func scale(by amount: CGFloat) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .autoreverse) {
            self.transform = CGAffineTransform(scaleX: amount, y: amount)
        } completion: { _ in
            self.transform = .identity
        }
    }
    
    func shake() {
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 1.1, initialSpringVelocity: 1.8, options: .curveEaseOut) {
            self.transform = CGAffineTransform(translationX: -2, y: 0)
        } completion: { _ in
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 1.2, initialSpringVelocity: 2.8, options: .curveEaseIn) {
                self.transform = CGAffineTransform(translationX: 4, y: 0)
            } completion: { _ in
                self.transform = .identity
            }

        }

    }
}
