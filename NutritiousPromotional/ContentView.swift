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
    @State var slides: [String] = ["estee 47", "estee 48"]
    @State var slide = false
    @State var products: [String] = ["estee 17", "estee 22", "estee 19", "estee 20"]
    @State var prices: [String] = ["$27.00", "$42.00", "$47.00", "$48.00"]
    
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
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 360)
                    .background(Rectangle() .foregroundColor(light))
                    .padding(.vertical)
                    
                    Carousel()
                    
                    Button {
                        slide.toggle()
                    } label: {
                        Image(slide == true ? slides[1] : slides[0])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(25)
                            .shadow(radius: 5)
                            .padding()
                            .id(slide)
                            .transition(.opacity.animation(.easeOut))
                    }
                    
                    VStack {
                        Text("\"I've been using the Nutritious skincare products, and let me tell you, they are absolute game-changers!\"")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                            .frame(height: 25)
                        Text("Jenifer @fashionmejen")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(light)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 30)
                    .background(Rectangle() .foregroundColor(pink) .cornerRadius(25))
                    
                    VStack {
                        ForEach(0..<2) { h in
                            HStack {
                                ForEach(0..<2) { i in
                                    ZStack(alignment: .bottom) {
                                        Image(products[i + 2*h])
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 160)
                                        Text("\(prices[i + 2*h])")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .padding(8)
                                            .frame(width: 160)
                                            .background(Rectangle() .foregroundColor(green) )
                                            .opacity(0.8)
                                    }
                                    .cornerRadius(25)
                                    .shadow(radius: 10)
                                    .padding()
                                }
                            }
                        }
                    }
                    .padding(.bottom)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Link("Shop Now", destination: URL(string: "https://www.esteelauder.com/nutritious-skincare-benefits")!)
                        .font(.headline)
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
