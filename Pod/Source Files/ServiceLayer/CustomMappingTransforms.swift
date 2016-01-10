//
//  CustomMappingTransforms.swift
//  Pods
//
//  Created by William Hindenburg on 1/9/16.
//
//

import Foundation
import ObjectMapper

public class BaseClassesDateTransform: TransformType {
    public typealias Object = NSDate
    public typealias JSON = Double
    
    public init() {}
    
    public func transformFromJSON(value: AnyObject?) -> NSDate? {
        if let timeInt = value as? Double {
            return NSDate(timeIntervalSince1970: NSTimeInterval(timeInt))
        }
        
        if let timeStr = value as? String {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
            dateFormatter.timeZone = NSTimeZone(name: "UTC")
            let date = dateFormatter.dateFromString(timeStr)
            return date
        }
        
        return nil
    }
    
    public func transformToJSON(value: NSDate?) -> Double? {
        if let date = value {
            return Double(date.timeIntervalSince1970)
        }
        return nil
    }
}