//
//  TranslateDM.swift
//  GoogleTranslate
//
//  Created by Mavlon on 13/05/22.
//

import Foundation
import RealmSwift

//Taken from "https://app.quicktype.io/"
struct TranslateDM: Codable {
    let data: DataClass
}

struct DataClass: Codable {
    let translations: [Translation]
}

struct Translation: Codable {
    let translatedText: String
}

class TranslateHistory: Object {
    @objc dynamic var text: String?
}
