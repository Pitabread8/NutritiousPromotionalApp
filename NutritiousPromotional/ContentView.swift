//
//  ContentView.swift
//  NutritiousPromotional
//
//  Created by Sita on 6/30/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
            }
            .toolbar {
                ToolbarItemGroup(placement: .status) {
                Link("About", destination: URL(string: "https://www.esteelauder.com/nutritious-skincare-benefits")!)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .foregroundColor(.white)
                    .background(Rectangle()
                        .foregroundColor(.black))
                    .cornerRadius(25)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
