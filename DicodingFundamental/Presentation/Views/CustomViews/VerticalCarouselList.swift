//
//  VerticalCarouselList.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 06/11/21.
//

import SwiftUI

struct VerticalCarouselList<Content: View>: UIViewRepresentable {
    var content: Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    func makeUIView(context: Context) -> some UIView {
        let scrollView = UIScrollView()
        setUp(scrollView: scrollView)
        return scrollView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    func setUp(scrollView: UIScrollView) {
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        let hostView = UIHostingController(rootView: content)
        hostView.view.backgroundColor = .clear
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        // check for isActive if work or not
        let constraints = [
            hostView.view.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            hostView.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hostView.view.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ]
        scrollView.addSubview(hostView.view)
        scrollView.addConstraints(constraints)
    }
}
