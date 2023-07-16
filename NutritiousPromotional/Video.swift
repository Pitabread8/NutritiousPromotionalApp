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
    @Namespace var vid
    
    var body: some View {
        NavigationView {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack {
                        VideoPlayer(player: player)
                            .frame(width: 400, height: 400)
                        let _ = player.isMuted = true
                    }
                    .id(vid)
                    .background(GeometryReader { geometry in
                        Color.clear
                            .preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named("scroll")).origin)
                    })
                    .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                        if self.scrollPosition.y > value.y {
                            player.rate = 1.0
                            player.pause()
                            proxy.scrollTo(vid)
                        }
                        self.scrollPosition = value
                    }
                    Spacer()
                        .frame(height: 1)
                }
                .frame(height: 400)
            }
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
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {}
}
