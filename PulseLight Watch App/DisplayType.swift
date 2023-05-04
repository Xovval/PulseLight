//
//  DisplayTypes.swift
//  PulseLight Watch App
//
//  Created by Axel Bauer on 03.05.23.
//

import Foundation

public enum DisplayType : String, Identifiable {
    public var id: Self {
        return self
    }
    
    case color
    case colorText
    case metrics
}
