//
//  Block.swift
//  Blockchain
//
//  Created by Hanis Hassim on 18/04/2020.
//  Copyright © 2020 H. All rights reserved.
//

import Foundation

public final class Block: Codable {
    var index: Int = 0
    var previousHash: String = ""
    var hash: String!
    var nonce: Int
    var dateCreated: String
    
    private (set) var transactions = [Transaction]()
    
    var key: String {
        get {
            let transactionsData = try! JSONEncoder().encode(transactions)
            let transactionsJsonString = String(data: transactionsData, encoding: .utf8)
            print("result key: \(String(index) + previousHash + String(nonce) + dateCreated + transactionsJsonString!)")
            return String(index) + previousHash + String(nonce) + dateCreated + transactionsJsonString!
        }
    }
    
    public init() {
        print("init:")
        nonce = 0
        dateCreated = Date().description
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
