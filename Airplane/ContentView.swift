import AVKit
import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    var body: some View {
        ZStack {
            GeometryReader { proxy in
                VideoContentView()
                    .frame(width: proxy.size.width * 16/9, height: proxy.size.height * 1.2)
                    .position(x: proxy.size.width / 2, y: proxy.size.height / 2)
            }
            RealityView { content in
                if let plane = await PlaneLoader().loadEntity() {
                    content.add(plane)
                }
            }
            .scaledToFit()
            .frame(width: 500, height: 500)
            .frame(depth: 300)
            .rotation3DEffect(
                Rotation3D(angle: Angle2D(degrees: 90),
                           axis: .init(x: 0, y: -1, z: 0))
            )
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
