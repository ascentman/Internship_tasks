//
//  SettingsViewController.swift
//  PhoneBook3
//
//  Created by Vova on 8/29/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

protocol ChangeThemeDelegate {
    func update()
}

final class SettingsViewController: UIViewController {
    
    @IBOutlet private weak var darkThemeSwitch: UISwitch!
    var delegate : TableViewController?
    private let selectedTheme = "Selected theme"
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let theme = UserDefaults.standard.value(forKey: selectedTheme) as? Bool {
            darkThemeSwitch.isOn = theme
        }
    }
    
    @IBAction func darkThemeChanged(_ sender: UISwitch) {
        
        if darkThemeSwitch.isOn {
            Theme.dark.apply()
        }
        else {
            Theme.light.apply()
        }
        self.applyAppearence()
        delegate?.update()
        UserDefaults.standard.set(sender.isOn, forKey: selectedTheme)
    }
}

extension UIViewController {
    
    // MARK: - applyAppearence
    
    func applyAppearence() {
        UIView.animate(withDuration: 0.1) {
            self.navigationController?.navigationBar.barTintColor = Theme.current.backgroundColor
            self.navigationController?.navigationBar.tintColor = Theme.current.textColor
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: Theme.current.textColor]
            self.navigationController?.navigationBar.layoutIfNeeded()
        }
    }
}
