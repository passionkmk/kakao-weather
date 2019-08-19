//
//  Climate.swift
//  kakao-weather
//
//  Created by we on 14/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import UIKit

// MARK: - Main
enum Climate: String {
    case tornado                    = "폭풍"
    case tropicalStorm              = "열대성 폭풍"
    case hurricane                  = "허리케인"
    case severeThunderstorms        = "심한 뇌우"
    case thunderstorms              = "뇌우"
    case mixedRainAndSnow           = "비와 눈"
    case mixedRainAndSleet          = "비와 진눈깨비"
    case mixedSnowAndSleet          = "눈과 진눈깨비"
    case freezingDrizzle            = "얼음 이슬비"
    case drizzle                    = "이슬비"
    case freezingRain               = "얼음 비"
    case showers                    = "소나기"
    case rain                       = "비"
    case snowFlurries               = "가벼운 눈"
    case lightSnowShowers           = "가벼운 소낙눈"
    case blowingSnow                = "날린 눈"
    case snow                       = "눈"
    case hail                       = "우박"
    case sleet                      = "진눈깨비"
    case dust                       = "먼지"
    case foggy                      = "흐림"
    case haze                       = "안개"
    case smoky                      = "연기"
    case blustery                   = "세찬 바람"
    case windy                      = "바람"
    case cold                       = "추위"
    case cloudy                     = "구름"
    case mostlyCloudyNight          = "대체로 밤에 흐림"
    case mostlyCloudyDay            = "대체로 낮에 흐림"
    case partlyCloudyNight          = "부분적으로 밤에 흐림"
    case partlyCloudyDay            = "부분적으로 낮에 흐림"
    case clearNight                 = "밤에 맑음"
    case sunny                      = "맑음"
    case fairNight                  = "대체로 밤에 맑음"
    case fairDay                    = "대체로 맑음"
    case mixedRainAndHail           = "비와 우박 동반"
    case hot                        = "더위"
    case isolatedThunderstorms      = "간헐적 뇌우"
    case scatteredThunderstorms     = "때때로 뇌우"
    case scatteredShowersDay        = "때때로 낮에 소나기"
    case heavyRain                  = "강한 비"
    case scatteredSnowShowersDay    = "때때로 낮에 소낙눈"
    case heavySnow                  = "강한 눈"
    case blizzard                   = "눈보라"
    case notAvailable               = "알수없음"
    case scatteredShowersNight      = "때때로 밤에 소나기"
    case scatteredSnowShowersNight  = "때때로 밤에 소낙눈"
    case scatteredThundershowers    = "때때로 번개 동반 소나기"
}

// MARK: - Extension Value
extension Climate {
    var weatherImage: UIImage {
        switch self {
        case .tornado:
            return UIImage(named: "wi-tornado")!
        case .tropicalStorm,
             .scatteredThundershowers:
            return UIImage(named: "wi-storm-showers")!
        case .hurricane:
            return UIImage(named: "wi-hurricane")!
        case .severeThunderstorms,
             .thunderstorms,
             .isolatedThunderstorms,
             .scatteredThunderstorms:
            return UIImage(named: "wi-thunderstorm")!
        case .mixedRainAndSnow,
             .mixedRainAndSleet,
             .freezingDrizzle,
             .drizzle,
             .freezingRain,
             .hail,
             .mixedRainAndHail:
            return UIImage(named: "wi-rain-mix")!
        case .mixedSnowAndSleet,
             .sleet:
            return UIImage(named: "wi-sleet")!
        case .showers,
             .lightSnowShowers:
            return UIImage(named: "wi-showers")!
        case .rain:
            return UIImage(named: "wi-rain")!
        case .heavyRain:
            return UIImage(named: "wi-rain-wind")!
        case .snowFlurries,
             .snow:
            return UIImage(named: "wi-snow")!
        case .blowingSnow,
             .heavySnow,
             .blizzard:
            return UIImage(named: "wi-snow-wind")!
        case .dust:
            return UIImage(named: "wi-dust")!
        case .foggy,
             .haze:
            return UIImage(named: "wi-fog")!
        case .smoky:
            return UIImage(named: "wi-smoke")!
        case .blustery,
             .windy:
            return UIImage(named: "wi-strong-wind")!
        case .cold:
            return UIImage(named: "wi-snowflake-cold")!
        case .cloudy:
            return UIImage(named: "wi-cloudy")!
        case .mostlyCloudyDay,
             .partlyCloudyDay:
            return UIImage(named: "wi-day-cloudy")!
        case .mostlyCloudyNight,
             .partlyCloudyNight:
            return UIImage(named: "wi-night-alt-cloudy")!
        case .clearNight:
            return UIImage(named: "wi-night-clear")!
        case .sunny:
            return UIImage(named: "wi-day-sunny")!
        case .fairNight:
            return UIImage(named: "wi-night-partly-cloudy")!
        case .fairDay:
            return UIImage(named: "wi-day-sunny-overcast")!
        case .hot:
            return UIImage(named: "wi-hot")!
        case .scatteredShowersDay,
             .scatteredSnowShowersDay:
            return UIImage(named: "wi-day-showers")!
        case .notAvailable:
            return UIImage(named: "wi-na")!
        case .scatteredShowersNight,
             .scatteredSnowShowersNight:
            return UIImage(named: "wi-night-alt-showers")!
        }
    }
    
    var name: String {
        return self.rawValue
    }
}

// MARK: - Extension Functions
extension Climate: CaseIterable {
    public static func fromCode(with code: Int) -> Climate {
        guard let climate = Climate.allCases.get(index: code) else {
            return .notAvailable
        }
        return climate
    }
}
