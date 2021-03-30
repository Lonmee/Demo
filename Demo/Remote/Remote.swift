//
//  Remote.swift
//  SearchDemo
//
//  Created by Lonmee on 8/16/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftHTTP

let HOST = "http://192.168.199.245:8181"
let API_VERSION = "/api/v1"

enum API: String {
    case USER = "/users/"
    case ACCOUNT = "/account/"
}

func accountReq(name: String) {
    HTTP.GET("http://localhost:8181/account?name=\(name)") { response in
        if #available(iOS 14.0, *) {
            print(String(unsafeUninitializedCapacity: response.data.count) {
                _ = $0.initialize(from: response.data)
                return response.data.count
            })
        }
    }
}

func httpGET(api: API, id: String?, completionHandler: ((Any) -> Void)? = nil) -> Void {
    HTTP.GET(HOST + API_VERSION + api.rawValue + (id ?? "")) { response in
        if let err = response.error {
            print("error: \(err.localizedDescription)")
            return //also notify app of failure as needed
        }
        let decoder = JSONDecoder()
        do {
            let data = try decoder.decode([User].self, from: response.text!.data(using: .utf8)!)
            if let handler = completionHandler {
                handler(data)
            }
        } catch {
            print(error)
        }
    }
}

//DispatchQueue.main.asyncAfter(deadline: .now()) {}
