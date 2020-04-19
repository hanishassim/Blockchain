//
//  BlockchainService.swift
//  App
//
//  Created by Hanis Hassim on 19/04/2020.
//

import Foundation
import BlockchainCore

class BlockchainService {
    private (set) var blockchain: Blockchain!
    
    init() {
        blockchain = Blockchain(initialBlock: Block())
    }
    
    func getBlockchain() -> Blockchain {
        return blockchain
    }
}
