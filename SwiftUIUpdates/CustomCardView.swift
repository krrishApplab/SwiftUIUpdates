//
//  File.swift
//  SwiftUIUpdates
//
//  Created by Krishna Raj on 08/06/26.
//

import SwiftUI

struct CustomCardView: View {
    var body: some View {
        VStack {
            Text("Custom Widget Element")
                .font(.headline)
            Text("Refracts background light dynamically.")
                .font(.subheadline)
        }
        .padding() 
        .glassEffect(in: .rect(cornerRadius: 16))
    }
}
