//
//  Transaction.swift
//  Blockchain
//
//  Created by Hanis Hassim on 18/04/2020.
//  Copyright © 2020 H. All rights reserved.
//

import Foundation

public enum TransactionType: String, Codable {
    case domestic
    case international
}

public final class Transaction: Codable {
    var from: String
    var to: String
    var amount: Double
    var fees: Double = 0
    var transactionType: TransactionType
    
    public init(from: String, to: String, amount: Double, transactionType: TransactionType) {
        self.from = from
        self.to = to
        self.amount = amount
        self.transactionType = transactionType
    }
}

#if  canImport(Vapor) && canImport(FluentSQLite)

import FluentSQLite
import Vapor

public extension Transaction: SQLiteModel {}
public extension Transaction: Migration {}
public extension Transaction: Content {}
public extension Transaction: Parameter {}

#endif
