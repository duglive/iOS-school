//
//  DetailVC.swift
//  URLSession
//
//  Created by Саид Дагалаев on 06.06.2021.
//

import UIKit

class DetailVC : UIViewController {
    
    var company = String()
    let network = Networking.shared
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    var nameLabel: BaseLabel = {
        let label = BaseLabel()
        label.textAlignment = .center
        return label
    }()
    
    var symbolLabel = BaseLabel()
    var priceLabel = BaseLabel()
    var priceChangeLabel = BaseLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setImageView()
        setNameLabel()
        setStackView()
    }
    
    func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    func setImageView() {
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        network.request(urlString: APIConstants.shared.getLogoURL(for: company)) { (data) in
            self.parseImage(data: data)
        }
    }
    
    func setNameLabel() {
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            nameLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
        
        network.request(urlString: APIConstants.shared.getDetailsURL(for: company)) { (data) in
            self.parseQuote(data: data)
        }
    }
    
    func setStackView() {
        let symbolLabel = UILabel()
        symbolLabel.text = "Symbol"
        
        let priceLabel = UILabel()
        priceLabel.text = "Price"
        
        let priceChangeLabel = UILabel()
        priceChangeLabel.text = "Price Change"
        
        let stackView1 = UIStackView(arrangedSubviews: [symbolLabel, priceLabel, priceChangeLabel])
        view.addSubview(stackView1)
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.axis = .vertical
        stackView1.spacing = 25
        
        let stackView2 = UIStackView(arrangedSubviews: [self.symbolLabel, self.priceLabel, self.priceChangeLabel])
        view.addSubview(stackView2)
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.axis = .vertical
        stackView2.spacing = 25
        
        let stackView3 = UIStackView(arrangedSubviews: [stackView1, stackView2])
        view.addSubview(stackView3)
        stackView3.translatesAutoresizingMaskIntoConstraints = false
        stackView3.axis = .horizontal
        stackView3.spacing = 200
        
        NSLayoutConstraint.activate([
            stackView3.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 50),
            stackView3.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 5)
        ])
    }
    
    func parseImage(data: Data) {
        do {
            let logoInfo = try JSONDecoder().decode(Logo.self, from: data)
            network.loadImage(for: logoInfo.url) { (data) in
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
            
        } catch {
            print("json parsing error: ", error.localizedDescription)
        }
    }
    
    func parseQuote(data: Data) {
        do {
            let companyInfo = try JSONDecoder().decode(Company.self, from: data)
            
            DispatchQueue.main.async { [weak self] in
                self?.displayStockInfo(companyName: companyInfo.companyName,
                                       symbol: companyInfo.symbol,
                                       price: companyInfo.latestPrice,
                                       priceChange: companyInfo.change)
            }
        } catch {
            print("json parsing error: ", error.localizedDescription)
        }
    }
    
    func displayStockInfo(companyName: String, symbol: String, price: Double, priceChange: Double) {
        nameLabel.text = companyName
        symbolLabel.text = symbol
        priceLabel.text = "\(price)"
        priceChangeLabel.textColor = priceChange < 0 ? .red : .green
        priceChangeLabel.text = "\(priceChange)"
    }
}
