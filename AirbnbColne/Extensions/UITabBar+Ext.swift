//
//  UITabBar+Ext.swift
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
import UIKit

extension UITabBar {
    private static var originalY: Double?
    
    static public func changeTabBarState(shouldHide: Bool) {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        windowScene?.windows.first(where: { $0.isKeyWindow })?.allSubviews().forEach({ view in
            if let tabBar = view as? UITabBar {
                if !tabBar.isHidden && shouldHide {
                    originalY = (tabBar.superview?.frame.origin.y)!
                    tabBar.superview?.frame.origin.y = (tabBar.superview?.frame.origin.y)! + 4.5
                } else if tabBar.isHidden && !shouldHide {
                    guard let originalY else {
                        return
                    }
                    tabBar.superview?.frame.origin.y = originalY
                }
                tabBar.isHidden = shouldHide
                tabBar.superview?.setNeedsLayout()
                tabBar.superview?.layoutIfNeeded()
            }
        })
    }
}
