//
//  Constants.swift
//  GUM
//
//  Created by Malik Farhan Asim on 25/03/2021.
//

import Foundation
import UIKit

struct Constants {
//    #E498EC - #A154AA
    
    struct UserdefaultHelper {
        static let isOpeningFirstTime = "IsOpeningFirstTime"
    }
    
    struct NotificationCenterKey {
        static let openSideMenu = "OpenSideMenu"
        static let pushPermisionController = "PushPermisionController"
    }
    
}

struct colors {
    
   static var primaryColor : UIColor = {
       let primaryColor = #colorLiteral(red: 0.8941176471, green: 0.5960784314, blue: 0.9254901961, alpha: 1)
        return primaryColor
    }()
    static var secendoryColor : UIColor = {
        let primaryColor = #colorLiteral(red: 0.631372549, green: 0.3294117647, blue: 0.6666666667, alpha: 1)
         return primaryColor
     }()
}
