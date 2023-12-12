//
//  ExploreView.swift
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

struct ExploreView: View {
    
    @State var showDestinationSearchView = false
    @StateObject private var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        NavigationView {
            
            if showDestinationSearchView {
                DestinationSearchView(isShow: $showDestinationSearchView, viewModel: viewModel)
            } else {
                
                ScrollView {
                    SearchAndFilterBar(viewModel: viewModel)
                        .onTapGesture {
                            viewModel.reset()
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        }
                    
                    
                    LazyVStack(spacing: 32) {
                        ForEach(viewModel.filteredProperties.isEmpty ? viewModel.properties : viewModel.filteredProperties) { property in
                            NavigationLink {
                                PropertyDetailsView(property: property)
                            } label: {
                                PropertyItemView(property: property)
                                    .frame(height: 380)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                }
                .navigationBarHidden(true)
                .onAppear {
                    UITabBar.changeTabBarState(shouldHide: false)
                }
            }
        }
        

    }
}

#Preview {
    ExploreView()
}
