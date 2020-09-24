//
//  WidgetInfoProxy.swift
//  WidgetCenterProxy
//
//  Created by huszarcsaba on 2020. 09. 23..
//

import Foundation
import WidgetKit
import Intents

@objc(WidgetInfoProxy)
public class WidgetInfoProxy : NSObject {
    @objc public var kind: String = ""
    @objc public var family: Int = WidgetFamily.systemSmall.rawValue
    @objc public var configuration: INIntent? = nil
}
