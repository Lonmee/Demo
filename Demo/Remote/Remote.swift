//
//  Remote.swift
//  SearchDemo
//
//  Created by Lonmee on 8/16/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftHTTP

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
