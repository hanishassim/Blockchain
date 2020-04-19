//
//  TransactionTypeSmartContract.swift
//  Blockchain
//
//  Created by Hanis Hassim on 19/04/2020.
//  Copyright © 2020 H. All rights reserved.
//

protocol SmartContract {
    func apply(_ transaction: Transaction)
}

class TransactionTypeSmartContract: SmartContract {
    func apply(_ transaction: Transaction) {
        var fees: Double = 0
        
        switch transaction.transactionType {
        case .domestic:
            fees = 0.02
        case .international:
            fees = 0.05
        }
        
        transaction.fees = transaction.amount * fees
        transaction.amount -= transaction.fees
    }
}
