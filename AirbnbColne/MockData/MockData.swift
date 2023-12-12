//
//  MockData.swift
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

import Foundation

class MockData {

    let properties: [Property] = [
    
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              ownerName: "Usman Saeed",
              ownerImageUrl: "4",
              numberOfBedrooms: 4,
              numberOfBathrooms: 4,
              numberOfGuests: 3,
              numberOfBeds: 4,
              pricePerNight: 490,
              latitude: 31.4697,
              longitude: 74.2728,
              imageUrls: ["image1","image2","image3"],
              address: "Johar Town",
              city: "Lahore",
              state: "Punjab",
              title: "Johar Town Villa",
              rating: 4.86,
              features: [.selfCheckIn, .superHost],
              amenities: [.wifi, .alarmSystem, .balcony],
              type: .villa),
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              ownerName: "Usman Saeed",
              ownerImageUrl: "4",
              numberOfBedrooms: 4,
              numberOfBathrooms: 4,
              numberOfGuests: 3,
              numberOfBeds: 4,
              pricePerNight: 490,
              latitude: 31.4697,
              longitude: 74.2728,
              imageUrls: ["image2","image3","image1"],
              address: "Johar Town",
              city: "Lahore",
              state: "Punjab",
              title: "Johar Town Villa",
              rating: 4.86,
              features: [.selfCheckIn, .superHost],
              amenities: [.wifi, .alarmSystem, .balcony],
              type: .villa),
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              ownerName: "Usman Saeed",
              ownerImageUrl: "4",
              numberOfBedrooms: 4,
              numberOfBathrooms: 4,
              numberOfGuests: 3,
              numberOfBeds: 4,
              pricePerNight: 490,
              latitude: 31.4805,
              longitude: 74.3239,
              imageUrls: ["image3","image2","image1"],
              address: "Model Town",
              city: "Lahore",
              state: "Punjab",
              title: "Model Town Villa",
              rating: 4.86,
              features: [.selfCheckIn, .superHost],
              amenities: [.wifi, .alarmSystem, .balcony],
              type: .villa),
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              ownerName: "Usman Saeed",
              ownerImageUrl: "4",
              numberOfBedrooms: 4,
              numberOfBathrooms: 4,
              numberOfGuests: 3,
              numberOfBeds: 4,
              pricePerNight: 490,
              latitude: 31.3695,
              longitude: 74.1768,
              imageUrls: ["image1","image3","image2"],
              address: "Bahria Town",
              city: "Lahore",
              state: "Punjab",
              title: "Bahria Town Villa",
              rating: 4.86,
              features: [.selfCheckIn, .superHost],
              amenities: [.wifi, .alarmSystem, .balcony, .kitchen, .office, .laundry, .pool, .tv],
              type: .villa)
    
    ]
    
}
