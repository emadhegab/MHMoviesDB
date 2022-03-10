import Foundation
import SwiftUI


struct FontResource {
    let fileName: String
    let fileExt: String
    let fontName: String
}

extension Font {

    static let movieTitleRegular = FontResource(
        fileName: "MorlRounded-Regular",
        fileExt: "ttf",
        fontName: "MorlRounded-Regular")
}

public enum FontLoader {

    internal static let fonts = [
        Font.movieTitleRegular,
    ]

    internal static func load(_ fontResource: FontResource) throws {
        let fontName = fontResource.fontName
        let bundle = Bundle.module

        guard let fontFilePath = bundle.path(
            forResource: fontName,
            ofType: fontResource.fileExt)
        else {
            throw Error.fontMissingInBundle(fontName)
        }

        guard let dataProvider = CGDataProvider(filename: fontFilePath)
        else {
            throw Error.failedToInitDataProvider(fontName)
        }

        guard let newFont = CGFont(dataProvider)
        else {
            throw Error.failedToInitDataProvider(fontName)
        }

        try registerFont(newFont)
    }

    /// Loads NAKD fonts.
    ///
    /// **Usage:**
    /// ```swift
    /// FontLoader.loadFonts()
    /// ```
    public static func loadFonts() {
        do {
            try fonts.forEach(load)
        }
        catch {
            preconditionFailure("Failed to load fonts: \(error)")
        }
    }

    static func registerFont(_ newFont: CGFont) throws {
        var error: Unmanaged<CFError>?
        _ = CTFontManagerRegisterGraphicsFont(newFont, &error)
    }

    enum Error: Swift.Error {
        case failedToRegisterFonts
        case failedToInitDataProvider(String)
        case failedToCreateCGFont(String)
        case fontMissingInBundle(String)
    }
}
