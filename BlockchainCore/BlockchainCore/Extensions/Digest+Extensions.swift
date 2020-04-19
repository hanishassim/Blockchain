//
//  Digest+Extensions.swift
//  Blockchain
//
//  Created by Hanis Hassim on 19/04/2020.
//  Copyright © 2020 H. All rights reserved.
//

import Foundation
#if canImport(CryptoKit)
import CryptoKit
#endif

@available(iOS 13, macOS 10.15, *)
extension Digest {
    var bytes: [UInt8] { Array(makeIterator()) }
    var data: Data { Data(bytes) }
    
    var hexString: String {
        bytes.map { String(format: "%02X", $0) }.joined()
    }
}

