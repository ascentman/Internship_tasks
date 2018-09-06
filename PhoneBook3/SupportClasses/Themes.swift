//
//  Themes.swift
//  PhoneBook3
//
//  Created by Vova on 8/29/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

enum Theme: Int {
    case light
    case dark
    
    private enum Keys {
        static let selectedTheme = "Selected theme"
    }
    
    static var current: Theme {
        let storedTheme = UserDefaults.standard.integer(forKey: Keys.selectedTheme)
        return Theme(rawValue: storedTheme) ?? .dark
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .light:
            return UIColor(white: 0.95, alpha: 0.05)
        case .dark:
            return UIColor(white: 0.4, alpha: 1.0)
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .light:
            return UIColor.black
        case .dark:
            return UIColor.white
        }
    }
    
    func apply() {
        UserDefaults.standard.set(rawValue, forKey: Keys.selectedTheme)
    }
}
