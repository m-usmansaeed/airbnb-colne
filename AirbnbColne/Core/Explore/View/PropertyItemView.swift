//
//  PropertyItemView.swift
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

struct PropertyItemView: View {
    
    let property: Property
    
    var body: some View {
        VStack(spacing: 8) {
            ImageCarouselView(images: property.imageUrls)
                .frame(height: 280)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
//            Details
            HStack(alignment:.top) {
                VStack(alignment: .leading) {
                    Text("\(property.city), \(property.state)")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)

                    Text("12 mi away")
                        .foregroundColor(.gray)
                    Text("Nov 3 - 10")
                        .foregroundColor(.gray)
                    HStack {
                        Text("$\(property.pricePerNight)")
                            .fontWeight(.semibold)
                        Text("night")
                    }.foregroundColor(.black)
                }
                
                Spacer()
                
                HStack(alignment: .center, spacing: 4) {
                    Image(systemName: "star.fill")
                    Text("\(property.rating)")
                }.foregroundColor(.black)
                
            }.font(.footnote)
            
            
        }.padding()
    }
}

#Preview {
    PropertyItemView(property: MockData().properties[0])
}
