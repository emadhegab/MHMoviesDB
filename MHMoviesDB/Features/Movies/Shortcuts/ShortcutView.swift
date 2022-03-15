//
//  ShortcutView.swift
//  MHMoviesDB
//
//  Created by Mohamed Hegab on 2022-03-15.
//

import SwiftUI

struct ShortcutView: View {
    let image: String
    let title: String

    var body: some View {
        ZStack {
            GeometryReader { geo in
                Image(image, bundle: .main)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: geo.size.height / 2)
                    .clipShape(Rectangle())
                    .cornerRadius(20)
                    .shadow(color: Color.red.opacity(0.6), radius: 20, x: 0, y: 30)

            Color
                .red
                .opacity(0.7)
                .ignoresSafeArea()
                .frame(height: geo.size.height / 2)
                .clipShape(Rectangle())
                .cornerRadius(20)

            Text(title)
                .font(Font.movieTitle)
                .foregroundColor(.white)
                .frame(width: geo.size.width,height: geo.size.height / 2)
                .multilineTextAlignment(.center)
                .clipShape(Rectangle())

            }
        }

    }
}

struct ShortcutView_Previews: PreviewProvider {
    static var previews: some View {
        ShortcutView(image: "spider", title: "Discover")
    }
}
