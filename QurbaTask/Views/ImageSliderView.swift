//
//  ImageSliderView.swift
//  QurbaTask
//
//  Created by Islam Ahmed on 19/03/2023.
//

import SwiftUI

struct ImageSliderView: View {
    var isProfile:Bool
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            Image(isProfile ? "postUserMale":"postProduct")
                .resizable()
                .frame(maxWidth: UIScreen.main.bounds.size.width, maxHeight: UIScreen.main.bounds.size.height)
                .scaledToFill()
            
            Button {
                dismiss()
            } label: {
                Image("colseCircle")
                    .resizable()
                    .iconImageView(40, color: .accentColor)
                    .padding(.top, 20)
            }
        }
        
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}



struct ImageSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSliderView(isProfile: false)
    }
}
