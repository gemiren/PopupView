//
//  CentrePopupConfig.swift of PopupView
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

public extension CentrePopupConfig {
    func backgroundColour(_ value: Color) -> Self { changing(path: \.backgroundColour, to: value) }
    func tapOutsideToDismiss(_ value: Bool) -> Self { changing(path: \.tapOutsideClosesView, to: value) }
    func horizontalPadding(_ value: CGFloat) -> Self { changing(path: \.horizontalPadding, to: value) }
    func cornerRadius(_ value: CGFloat) -> Self { changing(path: \.cornerRadius, to: value) }
    func contentAnimationTime(_ value: CGFloat) -> Self { changing(path: \.contentAnimationTime, to: value) }
    func transitionEntryScale(_ value: CGFloat) -> Self { changing(path: \.transitionEntryScale, to: value) }
    func transitionExitScale(_ value: CGFloat) -> Self { changing(path: \.transitionExitScale, to: value) }
    func transitionAnimation(_ value: Animation) -> Self { changing(path: \.transitionAnimation, to: value) }
}
public struct CentrePopupConfig: Configurable {
    var backgroundColour: Color = .white
    var tapOutsideClosesView: Bool = true
    var horizontalPadding: CGFloat = 12
    var cornerRadius: CGFloat = 24
    var contentAnimationTime: CGFloat = 0.1
    var transitionEntryScale: CGFloat = 1.1
    var transitionExitScale: CGFloat = 0.86
    var transitionAnimation: Animation = .spring(response: 0.28, dampingFraction: 1, blendDuration: 0.28)
}
