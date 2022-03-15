//
//  StartFeedView.swift
//  MHMoviesDB
//
//  Created by Mohamed Hegab on 2022-03-15.
//

import SwiftUI

struct ShortCut {
    let image: String
    let title: String
}

struct StartFeedView: View {

    let shortcuts: [ShortCut] = [ShortCut(image: "spider", title: "Discover"),
                                 ShortCut(image: "categories", title: "Categories"),
                                 ShortCut(image: "topRated", title: "Top Rated")
                                 ]
    var body: some View {
        ScrollView(.vertical) {
            ScrollView(.horizontal) {

                HStack {
                    ForEach(shortcuts, id: \.title) { shortcut in
                        ShortcutView(image: shortcut.image,
                                     title: shortcut.title)
                            .padding(6)
                            .frame(width: 250, height: 150)
                    }
                }

            }

            PopularMoviesView()
        }
    }
}

struct StartFeedView_Previews: PreviewProvider {
    static var previews: some View {
        StartFeedView()
    }
}
