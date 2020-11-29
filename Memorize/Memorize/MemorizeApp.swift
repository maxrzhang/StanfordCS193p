//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Max Zhang on 11/16/20.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
