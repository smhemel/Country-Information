//
//  ViewController.swift
//  Country Information
//
//  Created by S M HEMEL on 1/3/19.
//  Copyright © 2019 S M HEMEL. All rights reserved.
//

import UIKit

// MARK: - Data Model

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
    var otherAcronyms = [String]()
    var otherNames = [String]()
}
struct allData: Decodable {
    var name: String?
    var capital: String?
    var population: Int?
    var area: Double?
    var flag: String?
    
}

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var allCountryInformation = [allData]()
    var filteredData: [allData]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        searchBar.delegate = self
        getData()
        filteredData = allCountryInformation
    }
    
    
    func setData() {
        filteredData = allCountryInformation
    }
    
    
    // MARK: - Parsing Data
    
    func getData() {
        guard let url = URL(string: "https://restcountries.eu/rest/v2/all") else {
            print("url error.")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                self.allCountryInformation = try JSONDecoder().decode([allData].self, from: data!)
                
                for _ in self.allCountryInformation {
                    //print(da.name!)
                    DispatchQueue.main.async {
                        self.tableview.reloadData()
                    }
                }
                
            } catch {
                print("Error in get json data")
            }
        }.resume()
        
        
    }
    
    
    // MARK: - Table View Function
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.countryNameLabel.text = "\(String(describing: filteredData[indexPath.row].name!))"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail: DetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailsViewController
        detail.info = "Name: \(String(describing: filteredData[indexPath.row].name!))\nCapital: \(String(describing: filteredData[indexPath.row].capital!))\nPopulation: \(String(describing: filteredData[indexPath.row].population!))\nArea: \(String(describing: filteredData[indexPath.row].area!))"
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    //MARK: - Search Function
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = searchText.isEmpty ? allCountryInformation: allCountryInformation.filter({ (dataString) -> Bool in
            return dataString.name!.range(of: searchText, options: .caseInsensitive) != nil
        })
        tableview.reloadData()
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
}

