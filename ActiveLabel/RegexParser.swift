//
//  RegexParser.swift
//  ActiveLabel
//
//  Created by Pol Quintana on 06/01/16.
//  Copyright © 2016 Optonaut. All rights reserved.
//

import Foundation

struct RegexParser {
    
    static let urlPattern = "((^| )(?:(http|https|Http|Https):\\/\\/(?:(?:[a-zA-Z0-9\\$\\-\\_\\.\\+\\!\\*\\'\\(\\)"
            + "\\,\\;\\?\\&\\=]|(?:\\%[a-fA-F0-9]{2})){1,64}(?:\\:(?:[a-zA-Z0-9\\$\\-\\_"
            + "\\.\\+\\!\\*\\'\\(\\)\\,\\;\\?\\&\\=]|(?:\\%[a-fA-F0-9]{2})){1,25})?\\@)?)?"
            + "((?:(?:[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}\\.)+"
            + "(?:"
            + "(?:aero|agency|arpa|asia|a[cdefgilmnoqrstuwxz])"
            + "|(?:band|bar|biz|boutique|b[abdefghijmnorstvwyz])"
            + "|(?:cab|cafe|camera|cards|cat|catering|clinic|club|coffee|com|company|consulting|coop|c[acdfghiklmnoruvxyz])"
            + "|(?:dance|deals|design|d[ejkmoz])"
            + "|(?:edu|email|events|e[cegrstu])"
            + "|(?:farm|film|florist|flowers|f[ijkmor])"
            + "|(?:gallery|gifts|global|golf|gov|graphics|guide|guru|g[abdefghilmnpqrstuwy])"
            + "|(?:house|h[kmnrtu])"
            + "|(?:info|int|international|i[delmnoqrst])"
            + "|(?:jobs|j[emop])"
            + "|(?:kitchen|k[eghimnrwyz])"
            + "|(?:legal|life|lighting|limo|live|love|l[abcikrstuvy])"
            + "|(?:media|menu|miami|mil|mobi|museum|m[acdeghklmnopqrstuvwxyz])"
            + "|(?:name|net|nyc|n[acefgilopruz])"
            + "|(?:offline|online|org|om)"
            + "|(?:party|photo|photography|photos|pics|pictures|press|pro|productions|p[aefghklmnrstwy])"
            + "|qa"
            + "|(?:realtor|red|rentals|restaurant|rocks|r[eouw])"
            + "|(?:salon|services|site|solutions|space|studio|style|s[abcdeghijklmnortuvxyz])"
            + "|(?:tel|tirol|today|travel|t[cdfghjklmnoprtvwz])"
            + "|u[agkmsyz]"
            + "|(?:vegas|video|vision|v[aceginu])"
            + "|(?:website|wedding|works|w[fs])"
            + "|xyz"
            + "|(?:yoga|y[etu])"
            + "|z[amw]))"
            + "|(?:(?:25[0-5]|2[0-4]"
            + "[0-9]|[0-1][0-9]{2}|[1-9][0-9]|[1-9])\\.(?:25[0-5]|2[0-4][0-9]"
            + "|[0-1][0-9]{2}|[1-9][0-9]|[1-9]|0)\\.(?:25[0-5]|2[0-4][0-9]|[0-1]"
            + "[0-9]{2}|[1-9][0-9]|[1-9]|0)\\.(?:25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}"
            + "|[1-9][0-9]|[0-9])))"
            + "|\\.\\.\\."
            + "(?:\\:\\d{1,5})?)"
            + "(\\/(?:(?:[a-zA-Z0-9\\;\\/\\?\\:\\@\\&\\=\\#\\~"
            + "\\-\\.\\+\\!\\*\\'\\(\\)\\,\\_])|(?:\\%[a-fA-F0-9]{2}))*)?"
            + "(?:\\b|$)"
    
    static let phonePattern = "(\\+[0-9]{1,2}\\s?(\\(?\\s?[0-9]{3}[\\- \\. \\)]*))?(00[0-9]{1,2}\\s?(\\(?\\s?[0-9]{3}[\\- \\. \\)]*))?(\\(?\\s?[0-9]{3}[\\- \\. \\)]*)?[0-9]{3}[\\- \\.]?[0-9]{4}"
    
    static let urlDetector = try? NSRegularExpression(pattern: urlPattern, options: [.CaseInsensitive])
    static let phoneDetector = try? NSRegularExpression(pattern: phonePattern, options: [.CaseInsensitive])
    
    static func getURLs(fromText text: String, range: NSRange) -> [NSTextCheckingResult] {
        guard let urlDetector = urlDetector else { return [] }
        return urlDetector.matchesInString(text, options: [], range: range)
    }
    
    static func getPhoneNumbers(fromText text: String, range: NSRange) -> [NSTextCheckingResult] {
        guard let phoneDetector = phoneDetector else { return [] }
        return phoneDetector.matchesInString(text, options: [], range: range)
    }
    
}