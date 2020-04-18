//
//  String+Extensions.swift
//  Blockchain
//
//  Created by Hanis Hassim on 18/04/2020.
//  Copyright © 2020 H. All rights reserved.
//

import Foundation
import CryptoKit

extension String {
    var sha1Hash: String {
        return SHA256.hash(data: Data(self.utf8)).description
    }
}
