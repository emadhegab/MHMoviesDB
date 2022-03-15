//
//  MHMoviesDBApp.swift
//  MHMoviesDB
//
//  Created by Mohamed Hegab on 2022-03-04.
//

import SwiftUI
import DesignSystem
@main
struct MHMoviesDBApp: App {

    var body: some Scene {
        FontLoader.loadFonts()
        return WindowGroup {
            StartFeedView()
        }
    }
}
