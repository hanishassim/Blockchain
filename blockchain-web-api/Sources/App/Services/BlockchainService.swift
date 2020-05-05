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
    
    func getNextBlock(transactions: [Transaction]) -> Block {
        let block = blockchain.getNextBlock(transactions: transactions)
        
        blockchain.addBlock(block)
        
        return block
    }
    
    func registerNodes(nodes: [BlockchainNode]) -> [BlockchainNode] {
        return blockchain.registerNodes(nodes: nodes)
    }
    
    func getNodes() -> [BlockchainNode] {
        return blockchain.getNodes()
    }
}
