//
//  CompanyModel.swift
//  URLSession
//
//  Created by Саид Дагалаев on 06.06.2021.
//

struct Company : Codable {
    let companyName: String
    let symbol: String
    let latestPrice: Double
    let change: Double
}
