//
//  ContentView.swift
//  NutritiousPromotional
//
//  Created by Sita on 6/30/23.
//

import SwiftUI

struct ContentView: View {
    @State var slides: [String] = ["estee 47", "estee 48"]
    @State var slide = false
    
    init() {
        UIToolbar.appearance().setBackgroundImage(UIImage(),
                                        forToolbarPosition: UIBarPosition.any,
                                        barMetrics: UIBarMetrics.default)
        UIToolbar.appearance().setShadowImage(UIImage(),
                                    forToolbarPosition: UIBarPosition.any)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Button {
                        slide.toggle()
                    } label: {
                        Image(slide == true ? slides[1] : slides[0])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding([.leading, .bottom, .trailing])
                            .id(slide)
                            .transition(.opacity.animation(.easeOut))
                    }
                    Video()
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .principal) {
                    Image("Estee_Lauder_Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 100)
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    Link("Store", destination: URL(string: "https://www.esteelauder.com/nutritious-skincare-benefits")!)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                        .background(Rectangle()
                            .foregroundColor(.black))
                        .cornerRadius(25)
                }
            }
            .toolbarBackground(.hidden, for: .navigationBar)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
