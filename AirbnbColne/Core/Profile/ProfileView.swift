//
//  ProfileView.swift
//  AirbnbColne
//  Copyright (c) Muhammad Usman Saeed
//
//  Using xCode 12.3, Swift 5.0
//  Running on macOS 14.1
//  Created on 12/12/2023
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        GeometryReader { metrics in
            VStack {
                Spacer()

                VStack(alignment: .leading, spacing: 32) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Profile")
                            .font(Font.largeTitle.weight(.semibold))
                        Text("Log in to start planning your next trip")
                    }
                    
                    VStack(alignment: .center) {
                        
                        Button {
                            
                        } label: {
                            Text("Log in")
                                .foregroundColor(.white)
                                .font(Font.subheadline.weight(.semibold))
                                .frame(width: metrics.size.width * 0.9, height: 48)
                                .background(Color.pink)
                                .cornerRadius(8)
                        }
                    }
                    
                    HStack {
                        Text("Don't have an account?")
                            .font(Font.caption)
                        
                        Text("Sign up")
                            .font(Font.caption.weight(.semibold))
                            .underline()
                    }
                    
                }
                .padding(.vertical)
                .frame(width: metrics.size.width * 1)
            
                VStack(spacing: 24) {
                    
                    ProfileOptionRowView(imageName: "gear", title: "Settings")
                    ProfileOptionRowView(imageName: "gear", title: "Accessibility")
                    ProfileOptionRowView(imageName: "questionmark.circle", title: "Visit the Help Center")

                }.padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ProfileView()
}
