//
//  CustomModifiers.swift
//  QurbaTask
//
//  Created by Islam Ahmed on 19/03/2023.
//

import SwiftUI



struct Title3: ViewModifier {
    var size: CGFloat = 20
    var currentColor : Color = .accentColor
    func body(content: Content) -> some View {
        content
            .font(AppTheme.fontSize(size))
            .foregroundColor(currentColor)
    }
}

struct iconImage: ViewModifier {
    var size: CGFloat = 20
    var currentColor : Color = AppTheme.grayColor
    func body(content: Content) -> some View {
        content
            .frame(width: size, height: size)
            .foregroundColor(currentColor)
            .padding(.horizontal)
    }
}

extension View {
    
    func title3View( _ size: CGFloat = 20, color:Color = .accentColor) -> some View {
        modifier(Title3(size: size, currentColor: color))
    }
    
    func subheadlineView( _ size: CGFloat = 15, color:Color = AppTheme.mainAppColor) -> some View {
        modifier(Title3(size: size, currentColor: color))
    }
    
    func bodyView( _ size: CGFloat = 17, color:Color = AppTheme.mainAppColor) -> some View {
        modifier(Title3(size: size, currentColor: color))
    }
    
    func headlineView( _ size: CGFloat = 17, color:Color = AppTheme.headerColor) -> some View {
        modifier(Title3(size: size, currentColor: color))
    }
    
    
    func footnoteView( _ size: CGFloat = 13, color:Color = AppTheme.footnoteColor) -> some View {
        modifier(Title3(size: size, currentColor: color))
    }
    
    
    func iconImageView( _ size: CGFloat = 20, color:Color = AppTheme.grayColor) -> some View {
        modifier(iconImage(size: size, currentColor: color))
    }
    
}









