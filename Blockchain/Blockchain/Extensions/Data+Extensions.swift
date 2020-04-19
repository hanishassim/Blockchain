//
//  Data+Extensions.swift
//  Blockchain
//
//  Created by Hanis Hassim on 19/04/2020.
//  Copyright © 2020 H. All rights reserved.
//

import Foundation

extension Data {
    public var prettyJSON: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
            let prettyString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        
        return prettyString
    }
}
