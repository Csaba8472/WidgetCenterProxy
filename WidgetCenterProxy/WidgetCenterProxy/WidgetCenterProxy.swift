//
//  WidgetCenterProxy.swift
//  WidgetCenterProxy
//
//  Created by huszarcsaba on 2020. 09. 22..
//

import Foundation
import WidgetKit
import Intents

@objc(WidgetCenterProxy)
public class WidgetCenterProxy : NSObject {
    
    @objc
    public func reloadTimeLines(ofKind: String){
        WidgetCenter.shared.reloadTimelines(ofKind: ofKind)
    }
    
    @objc
    public func reloadAllTimeLines(){
        WidgetCenter.shared.reloadAllTimelines()
    }
    
    @objc
    public func getCurrentConfigurations( completion: @escaping ([WidgetInfoProxy]) -> Void){
        WidgetCenter.shared.getCurrentConfigurations { results in
           
            do {
                let value = try results.get()
                
                var widgetInfoArr:[WidgetInfoProxy] = []
                
                for widgetInfo in value {
                    
                    let proxy = WidgetInfoProxy()
                    proxy.kind = widgetInfo.kind
                    proxy.family = widgetInfo.family.rawValue
                    proxy.configuration = widgetInfo.configuration
                    
                    widgetInfoArr.append(proxy)
                    
                }
                
                completion(widgetInfoArr)
                
            } catch {
                
                let proxy = WidgetInfoProxy()
                proxy.kind = "error"
                proxy.family = 0
                proxy.configuration = nil
                
                completion([proxy])
            }
           
            
            
        }
    }
}
