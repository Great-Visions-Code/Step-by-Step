//
//  AppInfo.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 10/8/25.
//

import Foundation
import UIKit

enum AppInfo {
    static var shortVersion: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "0.0.0"
    }
    static var buildNumber: String {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "0"
    }
    static var formattedVersion: String { "\(shortVersion) (\(buildNumber))" }
    static var bundleID: String { Bundle.main.bundleIdentifier ?? "—" }
    static var appName: String { Brand.appDisplayName }
}

enum DeviceInfo {
    static var systemName: String { UIDevice.current.systemName }
    static var systemVersion: String { UIDevice.current.systemVersion }
    static var model: String { UIDevice.current.model }

    static var modelIdentifier: String {
        var sys = utsname(); uname(&sys)
        return Mirror(reflecting: sys.machine).children.reduce(into: "") {
            guard let v = $1.value as? Int8, v != 0 else { return }
            $0.append(String(UnicodeScalar(UInt8(v))))
        }
    }

    static var screenDescription: String {
        let b = UIScreen.main.bounds
        let w = Int(b.width), h = Int(b.height), s = UIScreen.main.scale
        return "\(w)x\(h) @\(s)x"
    }

    static var battery: String {
        let d = UIDevice.current
        let was = d.isBatteryMonitoringEnabled
        d.isBatteryMonitoringEnabled = true
        defer { d.isBatteryMonitoringEnabled = was }
        let level = d.batteryLevel >= 0 ? String(format: "%.0f%%", d.batteryLevel * 100) : "Unknown"
        let state: String = {
            switch d.batteryState {
            case .charging: return "Charging"
            case .full: return "Full"
            case .unplugged: return "Unplugged"
            default: return "Unknown"
            }
        }()
        return "\(level) (\(state))"
    }

    static var freeDisk: String {
        guard
            let attrs = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory()),
            let free = attrs[.systemFreeSize] as? NSNumber
        else { return "—" }
        return ByteCountFormatter.string(fromByteCount: free.int64Value, countStyle: .binary)
    }

    static var totalDisk: String {
        guard
            let attrs = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory()),
            let total = attrs[.systemSize] as? NSNumber
        else { return "—" }
        return ByteCountFormatter.string(fromByteCount: total.int64Value, countStyle: .binary)
    }

    static var lowPowerMode: Bool { ProcessInfo.processInfo.isLowPowerModeEnabled }
    static var locale: String { Locale.current.identifier }
    static var timeZone: String { TimeZone.current.identifier }
    static var preferredLanguages: String { Locale.preferredLanguages.joined(separator: ", ") }
}
