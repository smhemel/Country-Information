//
//  ViewController.swift
//  Country Information
//
//  Created by S M HEMEL on 1/3/19.
//  Copyright © 2019 S M HEMEL. All rights reserved.
//

import UIKit

struct currencie: Decodable {
    var code: String?
    var name: String?
    var symbol: String?
}
struct language: Decodable {
    var iso639_1: String?
    var iso639_2: String?
    var name: String?
    var nativeName: String?
}
struct regionalBloc: Decodable {
    var acronym: String?
    var name: String?
    var otherAcronyms = [String?]()
    var otherNames = [String?]()
}
struct allCountry: Decodable {
    var name: String?
    var topLevelBomain = [String?]()
    var alpha2Code: String?
    var alpha3Code: String?
    var callingCodes = [String?]()
    var capital: String?
    var altSpellings = [String?]()
    var region: String?
    var subregion: String?
    var population: Int?
    var latlng = [Int?]()
    var demonym: String?
    var area: Int?
    var gini: Float?
    var timezones = [String?]()
    var borders = [String?]()
    var nativeName: String?
    var numericCode: String?
    var currencies = [currencie?]()
    var languages = [language?]()
    var translations = [String?:String?]()
    var flag: String?
    var regionalBlocs = [regionalBloc?]()
    var cioc: String?
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

