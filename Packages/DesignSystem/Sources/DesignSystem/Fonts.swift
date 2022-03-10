import SwiftUI


extension Font {

}
extension Font  {

    public static let movieTitle: Font = {
        Font.custom(movieTitleRegular.fontName, size: 50)
    }()

    public static let movieSmallTitle: Font = {
        Font.custom(movieTitleRegular.fontName, size: 20)
    }()


    public static let itemCaption: Font = {
        Font.custom(movieTitleRegular.fontName, size: 18)
    }()
}
