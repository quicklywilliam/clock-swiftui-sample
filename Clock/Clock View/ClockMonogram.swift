//
//  ClockMonogram.swift
//  Diem WatchKit Extension
//
//  Created by William Henderson on 6/28/20.
//  Copyright © 2020 William Henderson. All rights reserved.
//

import SwiftUI

struct ClockMonogram: View {
    @Environment(\.complicationRenderingMode) var mode
    let monogram: String
    
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Text(monogram).font(.title).padding(2).minimumScaleFactor(0.3)
            Spacer()
            
        }
    }
}

struct ClockMonogram_Previews: PreviewProvider {
    static var previews: some View {
        ClockMonogram(monogram: "HELLO")
    }
}
