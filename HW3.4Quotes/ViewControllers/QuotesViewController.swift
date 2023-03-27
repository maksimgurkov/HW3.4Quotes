//
//  QuotesViewController.swift
//  HW3.4Quotes
//
//  Created by Максим Гурков on 27.03.2023.
//

import UIKit

final class QuotesViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var quotesImage: UIImageView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var quotesButton: UIButton! {
        didSet {
            quotesButton.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var namePersonLabel: UILabel!
    @IBOutlet weak var quotesLabel: UILabel!
    
    // MARK: - Private properties
    private var quotes: [Quotes] = []
    private let networkManger = NetworkManager.shared
    private let imageManager = ImageManager.shared
    
    // MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        fetchData()
    }
    
    //MARK: - IBAction
    @IBAction func actionQuoteButton() {
        activityIndicator.startAnimating()
        fetchData()
    }
    
    // MARK: - Private functions
    private func fetchData() {
        networkManger.fetchDataWitchAlamofire(for: Link.url.rawValue) { [weak self] result in
            switch result {
            case .success(let quotes):
                self?.quotes = quotes
                self?.configure()
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    private func fetchImage(for imageString: String) {
        imageManager.fetchImage(from: imageString) { [weak self] imageData in
            self?.quotesImage.image = UIImage(data: imageData)
        }
    }
    
    private func configure() {
        quotes.forEach { quote in
            namePersonLabel.text = quote.character
            quotesLabel.text = quote.quote
            fetchImage(for: quote.image)
            activityIndicator.stopAnimating()
        }
    }
    
    

}

