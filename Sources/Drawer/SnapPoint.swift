//
//  File.swift
//  
//
//  Created by Mahdi BND on 6/11/22.
//

import SwiftUI

public enum SnapPoint: CaseIterable {
	case bottom, middle, top, fullscreen
	
	public init?(value: CGFloat) {
		if let point = SnapPoint.allCases.first(where: { $0.value == value }) { self = point }
		else { return nil }
	}
	
	public var value: CGFloat {
		switch self {
			case .bottom: return 80
			case .middle: return 400
			case .top: return UIScreen.main.bounds.height - 80
			case .fullscreen: return UIScreen.main.bounds.height
		}
	}
	
	public static var all: [SnapPoint] { [.bottom, .middle, .top] }
}

// MARK: - Dimming Extension
public extension SnapPoint {
	private enum DimmingOption: Double {
		case none = 0
		case soft = 0.3
		case medium = 0.5
	}
	
	private var dimming: DimmingOption {
		switch self {
			case .bottom: return .none
			case .middle: return .soft
			default: return .medium
		}
	}
	
	var opacity: Double { dimming.rawValue }
}


//struct ShippingOptions: OptionSet {
//	let rawValue: Int
//
//	static let nextDay    = ShippingOptions(rawValue: 1 << 0)
//	static let secondDay  = ShippingOptions(rawValue: 1 << 1)
//	static let priority   = ShippingOptions(rawValue: 1 << 2)
//	static let standard   = ShippingOptions(rawValue: 1 << 3)
//
//	static let express: ShippingOptions = [.nextDay, .secondDay]
//	static let all: ShippingOptions = [.express, .priority, .standard]
//}
