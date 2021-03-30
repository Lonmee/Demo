//
//  Large views.swift
//  Demo
//
//  Created by Lonmee on 9/10/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftUI

struct Large_views: View {
    let users = ["Paul Hudson", "Taylor Swift"]
    
    var body: some View {
        List(users, id: \.self) { user in
            NavigationLink(destination: Text("Detail View")) {
                Image(systemName: "lasso")
                    .resizable()
                    .frame(width: 50, height: 50)
                
                VStack(alignment: .leading) {
                    Text("Johnny Appleseed").font(.headline)
                    Text("Occupation: Programmer")
                }
            }
        }
        .navigationBarTitle("Large views")
    }
}

struct Large_views_Previews: PreviewProvider {
    static var previews: some View {
        Large_views()
    }
}
