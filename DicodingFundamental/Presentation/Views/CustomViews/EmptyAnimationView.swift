//
//  EmptyAnimationView.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 22/11/21.
//

import SwiftUI
import Lottie

struct EmptyAnimationView: UIViewRepresentable {
    typealias UIViewType = UIView
    let jsonFile: String
    func makeUIView(context: UIViewRepresentableContext<EmptyAnimationView>) -> UIView {
        let view = UIView(frame: .zero)
        let animationView = AnimationView(name: jsonFile)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.play()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context) {}
}
