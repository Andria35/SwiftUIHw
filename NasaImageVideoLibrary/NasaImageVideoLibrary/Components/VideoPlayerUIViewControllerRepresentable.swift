//
//  VideoPlayerUIViewControllerRepresentable.swift
//  NasaImageVideoLibrary
//
//  Created by Andria Inasaridze on 04.01.24.
//

import AVKit
import SwiftUI

struct VideoPlayerUIViewControllerRepresentable: UIViewControllerRepresentable {
    
    // MARK: - Properties
    var urlString: String

    // MARK: - Methods
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        guard let url = URL(string: urlString) else { return AVPlayerViewController() }

        let player = AVPlayer(url: url)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        return playerViewController
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
    }
}



