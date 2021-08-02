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

struct summaryText : View{
    var context: String
    
    init(_ content:String){
        context = content
    }
    var body: some View{
        Text(context).font(.system(size: 18).weight(.medium))
    }
}
