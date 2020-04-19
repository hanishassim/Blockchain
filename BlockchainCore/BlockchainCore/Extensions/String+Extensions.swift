//
//  String+Extensions.swift
//  Blockchain
//
//  Created by Hanis Hassim on 18/04/2020.
//  Copyright © 2020 H. All rights reserved.
//

import Foundation

extension String {
    var sha256Hash: String {
        return String(decoding: Data(self.utf8).sha256(), as: UTF8.self)
    }
}
