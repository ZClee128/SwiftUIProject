//
//  Task.swift
//  SwiftUIProject
//
//  Created by zclee on 2019/11/17.
//  Copyright © 2019 lee. All rights reserved.
//

import Foundation
import Moya

class ApiTask: NSObject {
    func login(username: String, password: String) -> Task {
        return Moya.Task.requestData(jsonToData(jsonDic: ["username": username,"password":password], targetTye: APi.login)!)
    }
}

// 字典转data
private func jsonToData(jsonDic: Dictionary<String,Any>,targetTye: APi) ->Data? {
    if !JSONSerialization.isValidJSONObject(jsonDic) {
        print("is not a valid json object")
        return nil
    }
// 如果设置options为JSONSerialization.WritingOptions.prettyPrinted,则打印格式好阅读
    let data = try? JSONSerialization.data(withJSONObject: jsonDic, options: JSONSerialization.WritingOptions.prettyPrinted)
    let str = String(data: data!, encoding: String.Encoding.utf8)
    print("\(targetTye)->json str:\(str!)")
    return data
}
