//
//  SwiftUITestAppApp.swift
//  SwiftUITestApp
//
//  Created by Masoud Roosta on 8/1/22.
//

import SwiftUI

@main
struct SwiftUITestAppApp: App {
    var body: some Scene {
        WindowGroup {
//            SpotifyChallenge(vm: ChallengeViewModel())
            AirdropAnimation(vm: ChallengeViewModel())
        }
    }
}
