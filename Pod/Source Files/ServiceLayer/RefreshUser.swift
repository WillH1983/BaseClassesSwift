//
//  User.swift
//  BaseClasses
//
//  Created by William Hindenburg on 8/2/15.
//  Copyright © 2015 William Hindenburg. All rights reserved.
//

import UIKit
import ObjectMapper

open class RefreshUser: BaseModel {
    open var refreshToken = ""
    
    override public init() {
        super.init()
    }
    
    required public init?(_ map: Map) {
        super.init(map)
    }
    
    open override func mapping(_ map: Map) {
        refreshToken <- map["RefreshToken"]
    }
}
