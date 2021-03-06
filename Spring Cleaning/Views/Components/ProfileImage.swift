//
//  ProfileImage.swift
//  Spring Cleaning
//
//  Created by Admin on 3/25/22.
//


import SwiftUI
import Foundation

struct ProfileImage: View {
    
    
    
    @State var showActionSheet = false
    @State var showImagePicker = false
    @State var imageSelected: UIImage?
    @State var changeProfileImage = false
    @State var sourceType: UIImagePickerController.SourceType = .camera
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing){
            Button {
                self.showActionSheet = true
                
            } label: {
                
                
                
                
                
                if let imageSelected = self.imageSelected {
                    
                    
                    Image(uiImage: imageSelected)
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 100, height: 100)
                    
                } else {
                    Image(systemName: "person")
                        .foregroundColor(.gray)
                        .font(.system(size: 100))
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 5))
                        .shadow(radius: 2)
                }
                
            }
            Button {
                self.showActionSheet = true
                
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(.white).font(.largeTitle)
                    .frame(width: 30, height: 30)
                    .background(Color.secondary)
                    .clipShape(Circle())
            }
            
        }
        .actionSheet(isPresented: $showActionSheet) {
            
            ActionSheet(title: Text("Select picture"), message: nil,
                        buttons: [
                            .default(Text("Camera"), action: {
                                self.showImagePicker = true
                                self.sourceType = .camera
                            }),
                            .default(Text("Photo Library"), action: {
                                self.showImagePicker = true
                                self.sourceType = .photoLibrary
                            }),
                            .cancel()
                        ])
        }.sheet(isPresented: $showImagePicker) {
            ImagePicker(selectedImage: $imageSelected, sourceType: self.sourceType)
        }
    }
    
    
}

