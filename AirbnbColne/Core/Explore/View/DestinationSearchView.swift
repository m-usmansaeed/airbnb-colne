//
//  DestinationSearchView.swift
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

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var isShow: Bool
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var selectedStartDate: Date = Date()
    @State private var selectedEndDate: Date = Date()
    @State private var  numberOfGuests = 0

    @ObservedObject var viewModel: ExploreViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button {
                    self.isShow.toggle()
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundColor(.black)
                }
                Spacer()
                if !viewModel.destination.isEmpty {
                    Button("Clear") {
                        viewModel.destination = ""
                    }
                    .foregroundColor(.black)
                    .font(Font.headline.weight(.semibold))
                }
            }.padding()
                        
            VStack(alignment: .leading) {
                
                if selectedOption == .location {
                    Text("Where to?")
                    
                    HStack {
                        Image(systemName: "magnifyingglass").padding(.leading)
                        TextField("Search destination", text: $viewModel.destination, onCommit: {
                            viewModel.filterPropertiesForLocation()
                            isShow.toggle()
                        }).font(.subheadline)
                            
                    }
                    .frame(height: 44)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 0.5)
                            .frame(height: 44)
                    )
                }else{
                    CollapsedPickerView(title: "Where", destination: "Add destination")
                }
                                        
            }
            .modifier(SearchPickersModifier())
            .frame(height: selectedOption == .location ? 120 : 65)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .location
                }
            }
            
            //            date selection view
            VStack(alignment: .leading) {
                if selectedOption == .dates {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack {
                        DatePicker("From", selection: $selectedStartDate, displayedComponents: .date)
                        Divider()
                        DatePicker("To", selection: $selectedEndDate, displayedComponents: .date)
                    }
                    .foregroundColor(.gray)
                    .font(Font.headline.weight(.semibold))
                    
                }else{
                    CollapsedPickerView(title: "When", destination: "Add detes")
                }
            }
            .modifier(SearchPickersModifier())
            .frame(height: selectedOption == .dates ? 180 : 65)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .dates
                }
            }
            
//            number of guests

            VStack(alignment: .leading) {
                if selectedOption == .guests {
                    
                    Text("Who's coming")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Stepper {
                        Text("\(numberOfGuests) Adults")
                    } onIncrement: {
                        numberOfGuests += 1
                    } onDecrement: {
                        guard numberOfGuests > 0 else { return }
                        numberOfGuests -= 1
                    }
                    
                }else{
                    CollapsedPickerView(title: "Who", destination: "Add guests")
                }
            }
            .modifier(SearchPickersModifier())
            .frame(height: selectedOption == .guests ? 120 : 65)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .guests
                }
            }
            Spacer()

        }
    }
}

#Preview {
    DestinationSearchView(isShow: .constant(true), viewModel: ExploreViewModel(service: ExploreService()))
}

struct CollapsedPickerView: View {
    let title: String
    let destination: String

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title).foregroundColor(.gray)
                Spacer()
                Text(destination)
            }
        }
        
    }
}
