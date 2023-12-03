//
//  CustomFont.swift
//  QUSH.product
//
//  Created by Aldiyar Saken on 30.05.2023.
//

import SwiftUI

struct CustomFont: ViewModifier {
    var textStyle: TextStyle
    var customFontSize: CGFloat?

    var name: String {
        switch textStyle {
        case .largeTitle, .title, .title2, .title3:
            return "Poppins Bold"
        case .body, .subheadline, .footnote, .caption:
            return "Inter Regular"
        case .headline, .subheadline2, .footnote2, .caption2:
            return "Inter SemiBold"
        }
    }

    var size: CGFloat {
        if let customSize = customFontSize {
            return customSize
        }

        switch textStyle {
        case .largeTitle:
            return 34
        case .title:
            return 28
        case .title2:
            return 24
        case .title3:
            return 20
        case .body:
            return 17
        case .headline, .subheadline, .subheadline2:
            return 17
        case .footnote, .footnote2:
            return 13
        case .caption, .caption2:
            return 12
        }
    }

    var relative: Font.TextStyle {
        switch textStyle {
        case .largeTitle:
            return .largeTitle
        case .title:
            return .title
        case .title2:
            return .title2
        case .title3:
            return .title3
        case .body:
            return .body
        case .headline:
            return .headline
        case .subheadline, .subheadline2:
            return .subheadline
        case .footnote, .footnote2:
            return .footnote
        case .caption, .caption2:
            return .caption
        }
    }

    func body(content: Content) -> some View {
        content.font(.custom(name, size: size, relativeTo: relative))
    }
}

extension View {
    func customFont(_ textStyle: TextStyle, font customFontSize: CGFloat? = nil) -> some View {
        modifier(CustomFont(textStyle: textStyle, customFontSize: customFontSize))
    }
}

enum TextStyle {
    case largeTitle
    case title
    case title2
    case title3
    case body
    case headline
    case subheadline
    case subheadline2
    case footnote
    case footnote2
    case caption
    case caption2
}
