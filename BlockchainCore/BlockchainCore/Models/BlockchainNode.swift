//
//  BlockchainNode.swift
//  BlockchainCore
//
//  Created by Hanis Hassim on 20/04/2020.
//  Copyright © 2020 H. All rights reserved.
//

import Foundation

public final class BlockchainNode: Codable {
    var address: String
    
    public init(address: String) {
        self.address = address
    }
}

#if  canImport(Vapor) && canImport(FluentSQLite)

import FluentSQLite
import Vapor

public extension BlockchainNode: SQLiteModel {}
public extension BlockchainNode: Migration {}
public extension BlockchainNode: Content {}
public extension BlockchainNode: Parameter {}

#endif
