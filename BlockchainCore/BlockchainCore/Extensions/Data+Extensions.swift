//
//  Data+Extensions.swift
//  Blockchain
//
//  Created by Hanis Hassim on 19/04/2020.
//  Copyright © 2020 H. All rights reserved.
//

import Foundation
#if canImport(CryptoKit)
import CryptoKit
#endif
import CommonCrypto

extension Data {
    public var prettyJSON: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
            let prettyString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        
        return prettyString
    }
    
    public func sha256() -> Data {
        if #available(iOS 13, macOS 10.15, *) {
            return self.sha256_iOS13()
        } else {
            return self.sha256_legacy()
        }
    }
}

@available(iOS 13.0, macOS 10.15, *)
private extension Data {
    func sha256_iOS13() -> Data {
        return SHA256.hash(data: self).data
    }
}

private extension Data {
    func sha256_legacy() -> Data {
        return self.hash(for: .sha256)
    }
    
    enum Algorithm {
        case sha256
        
        var digestLength: Int {
            switch self {
            case .sha256: return Int(CC_SHA256_DIGEST_LENGTH)
            }
        }
    }
    
    func hash(for algorithm: Algorithm) -> Data {
        let hashBytes = UnsafeMutablePointer<UInt8>.allocate(capacity: algorithm.digestLength)
        defer { hashBytes.deallocate() }
        switch algorithm {
        case .sha256:
            withUnsafeBytes { (buffer) -> Void in
                CC_SHA256(buffer.baseAddress!, CC_LONG(buffer.count), hashBytes)
            }
        }
        
        return Data(bytes: hashBytes, count: algorithm.digestLength)
    }
}
