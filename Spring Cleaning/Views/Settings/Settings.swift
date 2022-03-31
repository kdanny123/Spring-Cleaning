//
//  Settings.swift
//  Spring Cleaning
//
//  Created by Admin on 3/25/22.
//

import SwiftUI

struct Settings: View {
    
    
    @State private var showAlert: Bool = false
    
    
    @EnvironmentObject var session: SessionServiceImplementation
    
    @State var showActionSheet = false
    @State var showImagePicker = false
    @State var imageSelected = UIImage()
    @State var sourceType: UIImagePickerController.SourceType = .camera
    
    
    
    
    
    var body: some View {
        VStack {
            
            List {
                VStack {
                    ProfileSettingsHeader()
                    Button {
                        self.showActionSheet = true
                    } label: {
                        
                        
                        if let imageSelected = self.imageSelected {
                            Image(uiImage: imageSelected)
                                .resizable()
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 5))
                                .shadow(radius: 2)
                            
                            
                            
                            
                        } else {
                            Image(systemName: "person")
                                .foregroundColor(.gray)
                                .font(.system(size: 100))
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 5))
                                .shadow(radius: 2)
                        }
                        Text("Change Image")
                        
                    }
                    
                }
                
                Section {
                    Button {
                        showAlert = true
                    } label: {
                        HStack {
                            Text("Logout")
                                .foregroundColor(.red)
                            Spacer()
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                        }
                        .font(.system(size: 25, weight: .bold))
                        
                    }
                    .alert(isPresented:$showAlert) {
                        Alert(
                            title: Text("Are you sure you want to log out?"),
                            primaryButton: .destructive(Text("Log out")) {
                                session.logOut()

                            },
                            secondaryButton: .cancel()
                        )
                    }
                }
            }
            
            
        }
        .navigationBarTitle("User Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
