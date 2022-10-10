//
//  String+Description.swift
//  SwiftCombine
//
//  Created by Anthony Ebuka Nwudo on 09/10/2022.
//
import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
