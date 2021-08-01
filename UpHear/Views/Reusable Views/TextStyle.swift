//
//  TextStyle.swift
//  UpHear
//
//  Created by Meichel Rendio on 01/08/21.
//

import Foundation
import SwiftUI

struct grayText : View{
    var content : String
    var size: CGFloat
    var weight: Font.Weight
    
    
    var body: some View{
        Text(content).font(.custom("SF Pro Text", size: size).weight(weight)).foregroundColor(Colors.customGray)
    }
}

