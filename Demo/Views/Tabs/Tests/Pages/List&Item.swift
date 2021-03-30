//
//  List&Item.swift
//  Demo
//
//  Created by Lonmee on 9/10/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftUI
import CoreData

struct List_Item: View {
    let imageNames = ["10dwio4", "10dzrq9", "10eiy63"]
    var body: some View {
        VStack{
            List(imageNames, id: \.self) { image in
                Image(image)
                    .resizable()
                    .frame(width: 40, height: 40)
                Text(image)
                Text("Done")
                    .foregroundColor(.gray)
            }
        }
        .navigationBarTitle(Text("List & Item"))
        //List {
        //    ForEach(imageNames, id: \.self) { image in
        //        HStack {
        //            Image(image)
        //                .resizable()
        //                .frame(width: 40, height: 40)
        //            Text(image)
        //            Text("Done")
        //                .foregroundColor(.gray)
        //        }
        //    }
        //}
        //.navigationBarTitle(Text("List & Item"))
    }
}

struct List_Item_Previews: PreviewProvider {
    static var previews: some View {
        List_Item()
    }
}
