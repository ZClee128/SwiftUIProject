//
//  LoginModel.swift
//  SwiftUIProject
//
//  Created by zclee on 2019/11/17.
//  Copyright © 2019 lee. All rights reserved.
//

import Foundation
import ObjectMapper

class loginModel: Mappable{
    
    var username: String?
    var password: String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        username <- map["username"]
        password <- map["password"]
    }
    
    
}
