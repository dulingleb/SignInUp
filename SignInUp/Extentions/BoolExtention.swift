//
//  BoolExtention.swift
//  SignInUp
//
//  Created by Dulin Gleb on 28.8.23..
//

import UIKit

extension Bool {
    init(_ num: Int) {
        self.init(num != 0)
    }
}
