//
//  UIDevice.swift
//  SwiftUIDemo
//
//  Created by Rath! on 21/6/24.
//

import SwiftUI
import AudioToolbox


enum DeviceType: CustomStringConvertible {
    case iPhone3Series
    case iPhone4Series
    case iPhone5Series
    case iPhone6Series
    case iPhone7Series
    case iPhoneXSeries
    case iPhone11Series
    case iPhone12Series
    case iPhone13Series
    case iPadLegacy
    case iPadAir
    case iPad5thTo9thGen
    case iPadPro
    case iPadMini
    case appleTV
    case carPlay
    case unknown

    var description: String {
        switch self {
        case .iPhone3Series:
            return "Legacy iPhone (iPhone 3G, 3GS, 4, 4S, 5, 5c, 5s)"
        case .iPhone4Series:
            return "iPhone 6 Series (iPhone 6, 6 Plus, 6s, 6s Plus, SE 1st gen)"
        case .iPhone5Series:
            return "iPhone 7 Series (iPhone 7, 7 Plus, 8, 8 Plus, SE 2nd gen)"
        case .iPhone6Series:
            return "iPhone X Series (iPhone X, XS, XS Max, XR)"
        case .iPhone7Series:
            return "iPhone 11 Series (iPhone 11, 11 Pro, 11 Pro Max)"
        case .iPhoneXSeries:
            return "iPhone 12 Series (iPhone 12 mini, 12, 12 Pro, 12 Pro Max)"
        case .iPhone11Series:
            return "iPhone 13 Series (iPhone 13 mini, 13, 13 Pro, 13 Pro Max)"
        case .iPhone12Series:
            return "iPhone 13 Series (iPhone 13 mini, 13, 13 Pro, 13 Pro Max)"
        case .iPhone13Series:
            return "iPhone 13 Series (iPhone 13 mini, 13, 13 Pro, 13 Pro Max)"
        case .iPadLegacy:
            return "Legacy iPad (iPad, iPad 2, 3rd, 4th gen, iPad mini 1-4)"
        case .iPadAir:
            return "iPad Air Series (iPad Air, Air 2, Air 3)"
        case .iPad5thTo9thGen:
            return "iPad 5th-9th Generation (iPad 5th-9th gen)"
        case .iPadPro:
            return "iPad Pro Series (all iPad Pro models)"
        case .iPadMini:
            return "iPad mini Series (iPad mini 5th, 6th gen)"
        case .appleTV:
            return "Apple TV"
        case .carPlay:
            return "CarPlay"
        case .unknown:
            return "Unknown Device"
        }
    }
}




extension UIDevice{
    static func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        print("Vibrated")
    }
    
    static func getDeviceType() -> DeviceType {
        let device = UIDevice.current
        let idiom = device.userInterfaceIdiom

        switch idiom {
        case .phone:
            switch device.model {
            case "iPhone 3G", "iPhone 3GS", "iPhone 4", "iPhone 4S", "iPhone 5", "iPhone 5c", "iPhone 5s":
                return .iPhone3Series
            case "iPhone 6", "iPhone 6 Plus", "iPhone 6s", "iPhone 6s Plus", "iPhone SE (1st generation)":
                return .iPhone4Series
            case "iPhone 7", "iPhone 7 Plus", "iPhone 8", "iPhone 8 Plus", "iPhone SE (2nd generation)":
                return .iPhone5Series
            case "iPhone X", "iPhone XS", "iPhone XS Max", "iPhone XR":
                return .iPhone6Series
            case "iPhone 11", "iPhone 11 Pro", "iPhone 11 Pro Max":
                return .iPhone7Series
            case "iPhone 12 mini", "iPhone 12", "iPhone 12 Pro", "iPhone 12 Pro Max":
                return .iPhone11Series
            case "iPhone 13 mini", "iPhone 13", "iPhone 13 Pro", "iPhone 13 Pro Max":
                return .iPhone12Series
            default:
                return .unknown
            }
        case .pad:
            switch device.model {
            case "iPad", "iPad 2", "iPad (3rd generation)", "iPad (4th generation)", "iPad mini", "iPad mini 2", "iPad mini 3", "iPad mini 4":
                return .iPadLegacy
            case "iPad Air", "iPad Air 2", "iPad Air (3rd generation)":
                return .iPadAir
            case "iPad (5th generation)", "iPad (6th generation)", "iPad (7th generation)", "iPad (8th generation)", "iPad (9th generation)":
                return .iPad5thTo9thGen
            case "iPad Pro (12.9-inch)", "iPad Pro (9.7-inch)", "iPad Pro (12.9-inch) (2nd generation)", "iPad Pro (10.5-inch)", "iPad Pro (12.9-inch) (3rd generation)", "iPad Pro (11-inch)", "iPad Pro (12.9-inch) (4th generation)", "iPad Pro (11-inch) (2nd generation)", "iPad Pro (12.9-inch) (5th generation)", "iPad Pro (11-inch) (3rd generation)":
                return .iPadPro
            case "iPad mini (5th generation)", "iPad mini (6th generation)":
                return .iPadMini
            default:
                return .unknown
            }
        default:
            return .unknown
        }
    }
}
