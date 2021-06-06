//
//  MainVC.swift
//  URLSession
//
//  Created by Саид Дагалаев on 06.06.2021.
//

import UIKit

class MainVC : UITableViewController {
    
    var companies = [String : String]()
    let network = Networking.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCompanies()
    }
    
    func loadCompanies() {
        network.request(urlString: APIConstants.shared.getCompaniesURL) { (data) in
            do {
                let jsonCompanies = try JSONDecoder().decode([Company].self, from: data)
                
                for item in jsonCompanies {
                    self.companies[item.companyName] = item.symbol
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch {
                print("json parsing error: ", error.localizedDescription)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewCell()
        let companyNames = Array(companies.keys)
        cell.config(text: companyNames[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailVC()
        detailVC.company = Array(companies.values)[indexPath.row]

        navigationController?.pushViewController(detailVC, animated: true)
    }

}
