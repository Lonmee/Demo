//
//  UserCreator.swift
//  Demo
//
//  Created by Lonmee on 10/26/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftUI
import CoreData
import PhotosUI

struct UserCreator: View {
    
    @Environment(\.presentationMode) var mode
    @State var nick: String = ""
    @State var icon: Image = Image(systemName: "person.fill")
    @State var sex: String = "male"
    @State var age: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    @State var qq: String = ""
    @State var wechat: String = ""
    @State var pickerResults: [PHPickerResult] = []
    @State var pickerShown = false
    let pickerList = ["male", "female"]
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("Profile Creator")
                .foregroundColor(.blue)
                .font(.title3)
                .padding(.all, 20)
            Form {
                Section (header: Text("Head Icon:")) {
                    HStack (alignment: .center, spacing: 120) {
                        icon
                            .resizable()
                            .aspectRatio(1, contentMode: .fill)
                            .frame(width: 60, height: 60, alignment: .center)
                            .padding(.leading, 20)
                        Button("Change", action: {
                            pickerShown.toggle()
                        })
                        .padding(.all, 12)
                        .background(Color(UIColor(red: 0.84, green: 0.85, blue: 0.87, alpha: 0.6)))
                        .sheet(isPresented: $pickerShown, onDismiss: headIcon, content: {
                            SPHPickerViewController(results: $pickerResults, configuration: pHPickerConfiguration())
                        })
                    }
                }
                Section (header: Text("Infomation:")) {
                    TextField("Nick name", text: $nick)
                    HStack (alignment: .center, spacing: 10) {
                        Text("Sex")
                        Picker(selection: $sex, label: Text("Sex")) {
                            ForEach(pickerList, id: \.self) { value in
                                Text(String(value)).tag(value)
                            }
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    TextField("Age", text: $age)
                        .keyboardType(.numberPad)
                }
                Section (header: Text("Contack:")) {
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                    TextField("Phone", text: $phone)
                        .keyboardType(.phonePad)
                    TextField("QQ", text: $qq)
                        .keyboardType(.numberPad)
                    TextField("Wechat", text: $wechat)
                }
            }
            HStack(alignment: .center, spacing: 0) {
                Button(action: {
                    if !nick.isEmpty && !age.isEmpty && !sex.isEmpty {
                        addUser()
                    } else {
                        self.mode.wrappedValue.dismiss()
                    }
                }) {
                    !email.isEmpty && !phone.isEmpty && !qq.isEmpty && !wechat.isEmpty &&
                        !nick.isEmpty && !age.isEmpty && !sex.isEmpty ?
                        Text("Perfect & Create") :
                        !nick.isEmpty && !age.isEmpty && !sex.isEmpty ?
                        Text("Create") :
                        Text("Canel")
                }
                .frame(minWidth: UIScreen.main.bounds.width, minHeight: 48)
            }
            .background(Color(UIColor(red: 0.84, green: 0.85, blue: 0.87, alpha: 0.6)))
        }
    }
    
    private func addUser() {
        withAnimation {
            let uuid = UUID().uuidString
            let user = User(id: uuid, name: nick, sex: sex == "male", age: Int(age) ?? 0, contact: [Contact(uid: uuid, phone: phone, email: email, qq: qq, wechat: wechat)])
            httpPOST(api: .USER, param: [user]) { data in
                self.mode.wrappedValue.dismiss()
            }
        }
    }
    
    private func pHPickerConfiguration() -> PHPickerConfiguration {
        var configuration = PHPickerConfiguration(photoLibrary: .shared())
        configuration.filter = PHPickerFilter.images
        configuration.selectionLimit = 1
        return configuration
    }
    
    private func headIcon() -> Void {
        if pickerResults.count > 0 {
            if pickerResults[0].itemProvider.canLoadObject(ofClass: UIImage.self) {
                pickerResults[0].itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                    if let err = error {
                        print("Couldn't load image with error: \(err.localizedDescription )")
                    } else {
                        DispatchQueue.main.async {
                            icon = Image(uiImage: image as! UIImage)
                        }
                    }
                }
            }
        }
    }
}

struct UserCreator_Previews: PreviewProvider {
    static var previews: some View {
        UserCreator()
    }
}
