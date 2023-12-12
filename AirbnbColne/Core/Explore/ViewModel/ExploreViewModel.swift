//
//  ExploreViewModel.swift
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

class ExploreViewModel: ObservableObject {
    @Published var properties = [Property]()
    @Published var filteredProperties = [Property]()
    @Published var destination = "" {
        didSet {
            if destination.isEmpty {
                filteredProperties = []
            }
        }
    }

    private let service: ExploreService
    
    init(service: ExploreService) {
        self.service = service
        Task {
            try await fetchProperties()
        }
    }
    
    func fetchProperties() async {
        do {
            properties = try await service.fetchProperties()
        } catch {
            print("Something went wrong.\(error.localizedDescription)")
        }
    }
    
    func reset() {
        destination = ""
    }
    
    func filterPropertiesForLocation(){
        self.filteredProperties = []
        let filtered  = properties.filter ({
            $0.city.lowercased() == destination.lowercased() ||
            $0.state.lowercased() == destination.lowercased() ||
            $0.address.lowercased() == destination.lowercased()
        })
        self.filteredProperties = filtered.isEmpty ? properties : filtered
    }
    
}
