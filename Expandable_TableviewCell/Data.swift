//
//  Data.swift
//  Expandable_TableviewCell
//
//  Created by Md Sifat on 30/9/20.
//  Copyright © 2020 Md Sifat. All rights reserved.
//

import Foundation

class Data{
    var headerName: String?
    var subHeaderName = [String]()
    var isExpand: Bool = false
    
    init(headerName: String, subHeaderName: [String], isExpand: Bool) {
        self.headerName = headerName
        self.subHeaderName = subHeaderName
        self.isExpand = isExpand
    }
}
