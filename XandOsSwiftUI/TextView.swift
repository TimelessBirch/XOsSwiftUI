//
//  TextView.swift
//  XandOsSwiftUI
//
//  Created by Brandon Trimm on 2020-08-25.
//  Copyright © 2020 BrandonTrimm. All rights reserved.
//

import SwiftUI

struct TextView: View {
    
    @Binding var text:String
    
    // View for the text displayed at the top of the screen
    var body: some View {
        Text(text)
        .foregroundColor(.white)
        .fontWeight(.black)
        .font(.system(size: 50))
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(text: Binding.constant("Tic-Tac-Toe"))
    }
}
