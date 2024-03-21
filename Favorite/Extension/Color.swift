//
//  Color.swift
//  FavoriteView
//
//  Created by Azizbek Musurmonov   on 12/03/24.
//

import UIKit

//MARK: - UIColor rgb
extension UIColor {
    
    struct AppColor {
        let primary: UIColor = .rgb(252, 235, 79)
    }
    
    static func rgb (_ r:CGFloat, _ g:CGFloat, _ b:CGFloat) -> UIColor {
        UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    static func rgbAll (_ value:CGFloat) -> UIColor {
        UIColor(red: value/255, green: value/255, blue: value/255, alpha: 1)
    }
    static func rgbS (_ r:CGFloat, _ g:CGFloat, _ b:CGFloat, _ alpha:CGFloat) -> UIColor {
        UIColor(red: r/255, green: g/255, blue: b/255, alpha: alpha/1.0 )
    }
}
