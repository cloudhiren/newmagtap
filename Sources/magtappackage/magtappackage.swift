// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import UIKit


public class MagTapp {
    
    public static var shared = MagTapp()
    public var visualMeaningParam: VisualMeaningModel?
    public var word = ""
    
    public func showVisualMeaning(param: String) -> UIViewController {
        let storyboardName = "VisualStoryboard"
        let storyboard = UIStoryboard(name: storyboardName, bundle: .module)
        let ctrl = storyboard.instantiateViewController(withIdentifier: "VisualMeaningVC") as! VisualMeaningVC
        ctrl.word = param
        return ctrl
    }
}
