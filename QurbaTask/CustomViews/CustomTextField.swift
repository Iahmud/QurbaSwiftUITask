//
//  CustomTextField.swift
//  QurbaTask
//
//  Created by Islam Ahmed on 18/03/2023.
//

import SwiftUI

struct CustomTextField: View {
    var placeHolderText:String
    @Binding var text:String
    @Binding var isSecure:Bool
    
    let lineWidth: CGFloat = 1
    let cornerRadius: CGFloat = 15
    let strokeColor = AppTheme.grayColor
    let textColor = AppTheme.mainAppColor
    let currentFont = AppTheme.fontSize()
    var body: some View {
        Group {
            
            if isSecure {
                SecureField(LocalizedStringKey(placeHolderText), text: $text)
            } else {
                TextField(LocalizedStringKey(placeHolderText), text: $text)
            }
            
        }
        .font(currentFont)
        .foregroundColor(textColor)
        .padding(16)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(strokeColor, lineWidth: lineWidth)
        )
        
        
        
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(placeHolderText: "PlaceHolder", text: .constant(""), isSecure: .constant(false))
    }
}
