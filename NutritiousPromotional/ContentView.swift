//
//  ContentView.swift
//  NutritiousPromotional
//
//  Created by Sita on 6/30/23.
//

import SwiftUI

struct ContentView: View {
    let green = Color(red: 0.733, green: 0.718, blue: 0.31)
    let light = Color(red: 0.957, green: 0.816, blue: 0.855)
    let pink = Color(red: 0.953, green: 0.208, blue: 0.349)
    let dark = Color(red: 0.863, green: 0.075, blue: 0.259)
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
            Image("Estee_Lauder_Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 100)
                .padding(.bottom, 10)
            ScrollView {
                VStack {
                    Video()
                    VStack {
                        Text("The results are in.")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(green)
                        Spacer()
                            .frame(height: 25)
                        Text("Estee Lauder Nutritious makes skin happy!")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(green)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 340)
                    .background(Rectangle() .foregroundColor(light))
                    Carousel()
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
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Link("Shop Now", destination: URL(string: "https://www.esteelauder.com/nutritious-skincare-benefits")!)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                        .background(Rectangle()
                            .foregroundColor(green))
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
