//
//  OffsetKey.swift
//  TaskManager
//
//  Created by AMAR on 19/01/24.
//

import SwiftUI

struct OffsetKey: PreferenceKey{
    static let defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
