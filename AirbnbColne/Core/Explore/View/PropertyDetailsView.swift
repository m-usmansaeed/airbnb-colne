//
//  PropertyDetailsView.swift
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
import MapKit

struct PropertyDetailsView: View {
    
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var region: MKCoordinateRegion
    let property: Property

    init(property: Property) {
        self.property = property
        
        let region = MKCoordinateRegion(
            center: .init(latitude: property.latitude,longitude: property.longitude),
            span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1))
        self._region = State(initialValue: .init(center: region.center, span: region.span))
    }
    
    var body: some View {
            
        ZStack {
            
            
            ScrollView {
                ZStack(alignment: .topLeading){
                    ImageCarouselView(images: property.imageUrls)
                        .frame(height: 350)

                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.backward.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.white)
                            .padding(.top, 70)
                            .padding(.leading, 16)
                    }

                }
                VStack(alignment: .leading, spacing: 16) {
                    Text(property.title)
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    VStack(alignment: .leading) {
                        
                        HStack(alignment: .center, spacing: 4) {
                            Image(systemName: "star.fill")
                            Text("\(property.rating)")
                            Text("-")
                            Text("28 reviews")
                                .underline()
                        }.foregroundColor(.black)
                            .font(.footnote)
                        Text("\(property.city) \(property.state)")
                    }
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                
                //            Host view
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text("Entire villa hosted by")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Text("\(property.ownerName)")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        HStack(spacing: 2) {
                            Text("\(property.numberOfGuests) guests -")
                            Text("\(property.numberOfBedrooms) bedroom -")
                            Text("\(property.numberOfBeds) beds -")
                            Text("\(property.numberOfBathrooms) baths")
                        }.font(.footnote)
                            
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(property.ownerImageUrl)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                    }

                    
                }.padding()
                Divider()
                
                //            Property feature
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(property.features) { feature in
                        HStack(spacing: 12){
                            
                            Image(systemName: feature.imageName)
                            VStack(alignment: .leading) {
                                
                                Text(feature.title)
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                
                                Text(feature.subTitle)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                    }
                }.padding()
                Divider()
                
                //            Bedroom view
                VStack(alignment: .leading, spacing: 16) {
                    Text("Where you'll sleep")
                        .font(.headline)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(1...5, id: \.self) { bedroom in
                                ZStack {
                                    VStack(alignment:.leading) {
                                        Image(systemName: "bed.double")
                                        Text("Bedroom \(bedroom)")
                                            .font(.footnote)
                                    }.frame(width: 132, height: 100)
                                    //                                    .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(lineWidth: 1)
                                        .foregroundColor(.gray)
                                    //                                    }
                                }
                            }
                        }
                    }
                }.padding()
                Divider()
                
                //            listing amenities
                VStack(alignment: .leading, spacing: 16) {
                    
                    Text("What this place offers")
                        .font(.headline)
                    
                    ForEach(property.amenities) { amenity in
                        HStack {
                            Image(systemName: amenity.imageName)
                            Text(amenity.title)
                                .font(.footnote)
                            Spacer()
                        }
                    }
                }.padding()
                Divider()
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Where you'll be")
                    Map(coordinateRegion: $region, interactionModes: .pan)
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }.padding()
                
            }.padding(.bottom, 100)
            
            
            VStack(spacing: 0) {
                Spacer()
                Divider()

                VStack(spacing: 0) {
                    
                    HStack {
                        
                        VStack(alignment: .leading) {
                            Text("$\(property.pricePerNight)")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Text("Total before taxes")
                                .font(.footnote)
                            
                            Text("Oct 15 - 20")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .underline()
                        }
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("Reserve")
                                .foregroundColor(.white)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 140, height: 40)
                                .background(Color.pink)
                                .cornerRadius(8)
                        }
                        
                    }.padding(.horizontal, 32)

                }
                .frame(height: 90)
                .background(Color.white)
            }
            
            
        }
        .onAppear {
            UITabBar.changeTabBarState(shouldHide: true)
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()

        
    }
}

#Preview {
    PropertyDetailsView(property: MockData().properties[0])
}
