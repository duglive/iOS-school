//
//  Networking.swift
//  URLSession
//
//  Created by Саид Дагалаев on 06.06.2021.
//

import Foundation

protocol NetworkProtocol {
    func request(urlString: String, completion: @escaping (_ data: Data) -> ())
    func loadImage(for url: String, completion: @escaping (Data) -> ())
}

class Networking: NetworkProtocol {
    static let shared = Networking()
    
    func request(urlString: String, completion: @escaping (Data) -> ()) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let data = data,
                (response as? HTTPURLResponse)?.statusCode == 200
            else {
                DispatchQueue.main.async {
                    print("Network error \((response as? HTTPURLResponse)?.statusCode ?? 404)")
                }
                return
            }
            
            completion(data)
            
        }.resume()
    }
    
    func loadImage(for url: String, completion: @escaping (Data) -> ()) {
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard
                let data = data,
                (response as? HTTPURLResponse)?.statusCode == 200
            else {
                print("Error downloading image")
                return
            }
            
            completion(data)

        }.resume()
    }
}
