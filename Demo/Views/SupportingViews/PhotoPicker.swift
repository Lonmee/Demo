//
//  PhotoPicker.swift
//  Demo
//
//  Created by Lonmee on 5/4/21.
//
import SwiftUI
import UIKit
import Photos

struct PhotoPicker: View {
    @Environment(\.presentationMode) var presentationMode
    @State var pickerSelection = 0
    @State var photoList: [PHAsset] = []
    @State var albumList: [PHAssetCollection] = []
    @State var userAlbumList: [PHCollection] = []
    
    @State var allPhotos: [UIImage] = []
    
    fileprivate let imageManager = PHCachingImageManager()
    
    var body: some View {
        // let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 40, alignment: .center), count: 2)
        let rows: [GridItem] = Array(repeating: .init(.flexible(minimum: 130), spacing: 2, alignment: .center), count: 3)
        NavigationView {
            ScrollView(.vertical) {
                LazyVGrid(columns: rows, spacing: 2) {
                    ForEach(0...4, id: \.self) { i in
                        Image("IMG_F75DAC7E7AA3-1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120, alignment: .center)
                            .clipped()
                    }
                    
                    //                    ForEach(allPhotos, id: \.self) { uiIma in
                    //                        Image(uiImage: uiIma)
                    //                            .resizable()
                    //                            .scaledToFill()
                    //                            .frame(width: 120, height: 120, alignment: .center)
                    //                            .clipped()
                    //                    }
                }
                
                //                ScrollView {
                //                     LazyVGrid(columns: columns) {
                //                         ForEach((0...79), id: \.self) {
                //                             let codepoint = $0 + 0x1f600
                //                             let codepointString = String(format: "%02X", codepoint)
                //                             Text("\(codepointString)")
                //                             let emoji = String(Character(UnicodeScalar(codepoint)!))
                //                             Text("\(emoji)")
                //                         }
                //                     }.font(.largeTitle)
                //                 }
                
                
                // List {
                //     ForEach(albumList, id: \.self) { album in
                //         HStack {
                //             Text(album.localizedTitle!)
                //         }
                //     }
                // }
                // List {
                //     ForEach(userAlbumList, id: \.self) { userAlbum in
                //         HStack {
                //             Text(userAlbum.localizedTitle!)
                //         }
                //     }
                // }
            }
            .padding(.top, -50)
            .toolbar(content: {
                HStack {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    Spacer(minLength: 46)
                    Picker(selection: $pickerSelection, label: Text("Album"), content: {
                        Text("Photos").tag(0)
                        Text("Albums").tag(1)
                    })
                    Spacer(minLength: 110)
                }
            })
        }
        .onAppear {
            let allPhotosOptions = PHFetchOptions()
            allPhotosOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
            let allPhotos = PHAsset.fetchAssets(with: allPhotosOptions)
            let smartAlbums = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .albumRegular, options: nil)
            let userCollections = PHCollectionList.fetchTopLevelUserCollections(with: nil)
            
            if allPhotos.count > 0 {
                for i in 0..<allPhotos.count {
                    self.allPhotos = []
                    imageManager.requestImage(for: allPhotos[i], targetSize: .init(width: 100, height: 100), contentMode: .aspectFill, options: nil, resultHandler: { uiImage, info  in
                        self.allPhotos.append(uiImage!)
                        print(info!)
                    })
                }
            }
            if smartAlbums.count > 0 {
                for i in 0..<smartAlbums.count {
                    albumList.append(smartAlbums[i])
                }
            }
            if userCollections.count > 0 {
                for i in 0..<userCollections.count {
                    userAlbumList.append(userCollections[i])
                }
            }
        }
    }
}

struct PhotoPicker_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPicker()
    }
}
