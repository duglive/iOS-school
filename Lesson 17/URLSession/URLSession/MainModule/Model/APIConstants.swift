//
//  APIConstants.swift
//  URLSession
//
//  Created by Саид Дагалаев on 06.06.2021.
//

struct APIConstants {
    static let shared = APIConstants()
    
    private init() {}
    
    let token = "sk_d46576cede54442f97b7119ecf1ae1e9"
    
    var getCompaniesURL: String {
        return "https://cloud.iexapis.com/stable/stock/market/list/mostactive?token=\(token)"
    }
    
    func getDetailsURL(for symbol: String) -> String {
        return "https://cloud.iexapis.com/stable/stock/\(symbol)/quote/?token=\(self.token)"
    }
    
    func getLogoURL(for symbol: String) -> String {
        return "https://cloud.iexapis.com/stable/stock/\(symbol)/logo/?token=\(self.token)"
    }
}
