//
//  xoView.swift
//  XandOsSwiftUI
//
//  Created by Brandon Trimm on 2020-08-25.
//  Copyright © 2020 BrandonTrimm. All rights reserved.
//

import SwiftUI

struct xoView: View {
    
    @Binding var symbol:String
    
    // View for the blank, X, and O images
    var body: some View {
        Image(symbol)
        .resizable()
        .frame(width: 100, height: 100)
    }
}

struct xoView_Previews: PreviewProvider {
    static var previews: some View {
        xoView(symbol: Binding.constant("blank"))
    }
}
