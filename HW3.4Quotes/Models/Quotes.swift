//
//  Quotes.swift
//  HW3.4Quotes
//
//  Created by Максим Гурков on 27.03.2023.
//

struct Quotes: Decodable {
    
    let quote: String
    let character: String
    let image: String
    
    init(quotesData: [String: Any]) {
        quote = quotesData["quote"] as? String ?? ""
        character = quotesData["character"] as? String ?? ""
        image = quotesData["image"] as? String ?? ""
    }
    
    static func getQuotes(from value: Any) -> [Quotes] {
        guard let quotesData = value as? [[String: Any]] else { return [] }
        return quotesData.map { Quotes(quotesData: $0) }
        
    }
}

enum Link: String {
    case url = "https://thesimpsonsquoteapi.glitch.me/quotes"
}
