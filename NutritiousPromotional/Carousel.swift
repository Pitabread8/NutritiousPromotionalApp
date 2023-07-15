//
//  Carousel.swift
//  NutritiousPromotional
//
//  Created by Sita on 7/14/23.
//

import SwiftUI

struct Carousel: View {
    @State var images: [String] = ["estee 15", "estee 60", "estee 16", "estee 41", "estee 1", "estee 62"]
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    
    var body: some View {
        ZStack {
            ForEach(0..<6) { i in
                Image(images[i])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal)
                    .scaleEffect(1.0 - abs(distance(i)) * 0.4)
                    .opacity(1.0 - abs(distance(i)) * 0.3)
                    .offset(x: myXOffset(i), y: 0)
                    .zIndex(1.0 - abs(distance(i)) * 0.1)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    draggingItem = snappedItem + value.translation.width / 100
                }
                .onEnded { value in
                    withAnimation {
                        draggingItem = snappedItem + value.predictedEndTranslation.width / 100
                        draggingItem = round(draggingItem).remainder(dividingBy: Double(images.count))
                        snappedItem = draggingItem
                    }
                }
        )
    }
    
    func distance(_ item: Int) -> Double {
        return (draggingItem + Double(item)).remainder(dividingBy: Double(images.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(images.count) * distance(item)
        return sin(angle) * 200
    }
    
}

struct Carousel_Previews: PreviewProvider {
    static var previews: some View {
        Carousel()
    }
}
