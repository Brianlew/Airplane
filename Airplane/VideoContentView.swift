import AVKit
import SwiftUI

struct VideoContentView: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = makePlayerViewController()
        controller.showsPlaybackControls = false
        return controller
    }

    func makePlayerViewController() -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        let path = "\(Bundle.main.bundlePath)/\("background.mov")"
        let item = AVPlayerItem(url: URL(fileURLWithPath: path))
        let player = AVPlayer(playerItem: item)
        controller.player = player
        player.play()

        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) {_ in
            player.seek(to: CMTime.zero)
            player.play()
        }

        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}
