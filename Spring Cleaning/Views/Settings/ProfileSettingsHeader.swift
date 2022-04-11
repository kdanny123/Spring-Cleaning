//
//  ProfileSettingsHeader.swift
//  Spring Cleaning
//
//  Created by Admin on 3/25/22.
//

import SwiftUI

struct ProfileSettingsHeader: View {
    
    
    
    @State var showActionSheet = false
    @State var showImagePicker = false
    @State var imageSelected: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .camera
    
    var body: some View {
        
        
        ZStack(alignment: .bottomTrailing){
            Button {
                self.showActionSheet = true
            
            } label: {

                if let imageSelected = imageSelected {
                    Image(uiImage: imageSelected)
                        .applyCircleFrame()
                } else {
                    profileFrame
                        .applyCircleFrame()
                }


            }
        }
        .actionSheet(isPresented: $showActionSheet) {
            
            ActionSheet(title: Text("Select picture"), message: nil,
                        buttons: [
                            .default(Text("Photo Library"), action: {
                                self.showImagePicker = true
                                self.sourceType = .photoLibrary
                                
                            }),
                            .cancel()
                        ])
        }.sheet(isPresented: $showImagePicker) {
            ImagePicker(selectedImage: self.$imageSelected, sourceType: self.sourceType)
        }
    }
}

struct ProfileSettingsHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsHeader()
    }
}


let profileFrame: some View =
Image(systemName: "person")
    .foregroundColor(.gray)
    .font(.system(size: 100))
    .clipShape(Circle())
    .overlay(Circle().stroke(Color.gray, lineWidth: 5))
    .shadow(radius: 2)

