//
//  RoundButton.swift
//  AndOne
//
//  Created by Aldiyar Saken on 01.12.2023.
//

import SwiftUI

struct RoundButton: View {
    @State var title: String = "Title"
    var didTap: (()->())?
    var body: some View {
        Button{
            didTap?()
        } label: {
            Text(title)
                .font(.customfont(.bold, fontSize: 18))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
        .background(Color.blue)
        .cornerRadius(20)
    }
}

struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton()
            .padding(20)
    }
}
