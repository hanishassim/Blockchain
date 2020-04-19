//
//  Transaction.swift
//  Blockchain
//
//  Created by Hanis Hassim on 18/04/2020.
//  Copyright © 2020 H. All rights reserved.
//

import Foundation

enum TransactionType: String, Codable {
    case domestic
    case international
}

class Transaction: Codable {
    var from: String
    var to: String
    var amount: Double
    var fees: Double = 0
    var transactionType: TransactionType
    
    init(from: String, to: String, amount: Double, transactionType: TransactionType) {
        self.from = from
        self.to = to
        self.amount = amount
        self.transactionType = transactionType
    }
}

