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
        let grideWidth = (UIScreen.main.bounds.width - 2) / 3
        let rows: [GridItem] = Array(repeating: .init(.fixed(grideWidth), spacing: 1, alignment: .center), count: 3)
        NavigationView {
            ScrollView(.vertical) {
                LazyVGrid(columns: rows, spacing: 1) {
                    ForEach(0...40, id: \.self) { i in
                        NavigationLink(destination: ImagePreviewer(Image("IMG_F75DAC7E7AA3-1"))
                                        .background(Color.black)) {
                            Image("IMG_F75DAC7E7AA3-1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: grideWidth, height: grideWidth, alignment: .center)
                                .clipped()
                        }
                    }
//                    ForEach(allPhotos, id: \.self) { uiImg in
//                        NavigationLink(destination: ImagePreviewer(Image(uiImage: uiImg))
//                                        .background(Color.black)) {
//                            Image(uiImage: uiImg)
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: grideWidth, height: grideWidth, alignment: .center)
//                                .clipped()
//                        }
//                    }
                }
                
                
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
            .navigationBarTitleDisplayMode(.inline)
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
