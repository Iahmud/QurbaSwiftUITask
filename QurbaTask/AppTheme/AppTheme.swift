//
//  AppTheme.swift
//  QurbaTask
//
//  Created by Islam Ahmed on 18/03/2023.
//

import SwiftUI

class AppTheme {
    
    static var mainAppColor = Color("mainAppColor")
    static var headerColor = Color("headerColor")
    static var viewsBackground = Color("viewsBackground")
    static var grayColor = Color("grayColor")
    static var gradientStartColor = Color("gradientStartColor")
    static var gradientEndColor = Color("gradientEndColor")
    static var footnoteColor = Color("footnoteColor")

    static func fontSize(_ size: CGFloat = 16) -> Font {
        return Font.system(size: size)
    }

    
}
