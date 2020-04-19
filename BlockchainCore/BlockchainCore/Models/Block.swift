//
//  Block.swift
//  Blockchain
//
//  Created by Hanis Hassim on 18/04/2020.
//  Copyright © 2020 H. All rights reserved.
//

import Foundation

public class Block: Codable {
    var index: Int = 0
    var previousHash: String = ""
    var hash: String!
    var nonce: Int
    
    private (set) var transactions = [Transaction]()
    
    var key: String {
        get {
            let transactionsData = try! JSONEncoder().encode(transactions)
            let transactionsJsonString = String(data: transactionsData, encoding: .utf8)
            
            return String(index) + previousHash + String(nonce) + transactionsJsonString!
        }
    }
    
    public init() {
        nonce = 0
    }
    
    func addTransaction(transaction: Transaction) {
        transactions.append(transaction)
    }
}

#if  canImport(Vapor) && canImport(FluentSQLite)

import FluentSQLite
import Vapor

public extension Block: SQLiteModel {}
public extension Block: Migration {}
public extension Block: Content {}
public extension Block: Parameter {}

#endif
