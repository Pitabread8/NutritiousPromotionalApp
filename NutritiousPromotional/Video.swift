//
//  Video.swift
//  NutritiousPromotional
//
//  Created by Sita on 7/7/23.
//

import SwiftUI
import AVKit

struct Video: View {
    @State var player = AVPlayer(url: Bundle.main.url(forResource: "SP23_Nutritious_Hero_Campaign_Nutrigenomics_20s_1920x1920_Sound_Super_GLOBAL_COMP", withExtension: "mp4")!)
    @State private var scrollPosition: CGPoint = .zero
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
//                    ForEach((1...20), id: \.self) { row in
//                        Text("Row \(row)")
//                            .frame(height: 30)
//                            .id(row)
//                    }
                    VideoPlayer(player: player)
                        .scaledToFit()
                    let _ = player.isMuted = true
                }
                .background(GeometryReader { geometry in
                    Color.clear
                        .preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named("scroll")).origin)
                })
                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                    if self.scrollPosition.y > value.y {
                        player.rate = 1.0
                        player.pause()
                    } else if self.scrollPosition.y < value.y {
                        player.rate = -1.0
                        player.pause()
                    }
                    self.scrollPosition = value
                }
            }
            .coordinateSpace(name: "scroll")
            .navigationTitle("Scroll offset: \(scrollPosition.y)")
            .navigationBarTitleDisplayMode(.inline)
//            .scaledToFit()
        }
    }
}
    
struct Video_Previews: PreviewProvider {
    static var previews: some View {
        Video()
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero

    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
    }
}
