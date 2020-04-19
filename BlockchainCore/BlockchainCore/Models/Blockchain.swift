//
//  Blockchain.swift
//  Blockchain
//
//  Created by Hanis Hassim on 18/04/2020.
//  Copyright © 2020 H. All rights reserved.
//

import Foundation

public final class Blockchain: Codable {
    private (set) var blocks = [Block]()
    private (set) var smartContracts: [SmartContract] = [TransactionTypeSmartContract()]
    
    // To exclude smartContracts from decoding
    private enum CodingKeys: CodingKey {
        case blocks
    }
    
    public init(initialBlock: Block) {
        addBlock(initialBlock)
    }
    
    public func addBlock(_ block: Block) {
        // first block
        if blocks.isEmpty {
            block.previousHash = "00000000"
            block.hash = generateHash(for: block)
        }
        
        // Apply smart contracts
        for contract in smartContracts {
            block.transactions.forEach { contract.apply($0) }
        }
        
        blocks.append(block)
    }
    
    public func getNextBlock(transactions: [Transaction]) -> Block {
        let block = Block()
        transactions.forEach { transaction in
            block.addTransaction(transaction: transaction)
        }
        
        let previousBlock = getPreviousBlock()
        block.index = blocks.count
        block.previousHash = previousBlock.hash
        block.hash = generateHash(for: block)
        
        return block
    }
    
    private func getPreviousBlock() -> Block {
        return blocks[blocks.count - 1]
    }
    
    private func generateHash(for block: Block) -> String {
        let hash = block.key.sha256Hash

        return hash
    }
    
    public var print: NSString {
        let data = try! JSONEncoder().encode(self)
        guard let prettyJSON = data.prettyJSON else { return "" }
        
        return prettyJSON
    }
}
