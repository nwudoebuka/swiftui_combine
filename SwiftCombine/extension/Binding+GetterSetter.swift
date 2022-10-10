//
//  Binding+GetterSetter.swift
//  SwiftCombine
//
//  Created by Anthony Ebuka Nwudo on 06/10/2022.
//

import SwiftUI

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}
