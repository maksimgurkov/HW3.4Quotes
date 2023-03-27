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
    
    // MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

