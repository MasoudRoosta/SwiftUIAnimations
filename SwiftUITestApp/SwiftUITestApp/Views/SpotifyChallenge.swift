//
//  ContentView.swift
//  SwiftUITestApp
//
//  Created by Masoud Roosta on 8/1/22.
//

import SwiftUI
struct SpotifyChallenge: View {
    @StateObject var vm: ChallengeViewModel
    let cellSize: Int = 5
    @State private var heightLevels: [CGFloat] = Array(repeating: 3, count: 5)
    let timer = Timer.publish(every: 0.25 , on: .main, in: .common).autoconnect()
    var body: some View {
        HStack(spacing: 8){
            ForEach(0..<cellSize, id: \.self) {
                equalizerCell(heightLevel: heightLevels[$0])
            }
        }
        .onReceive(timer) { _ in
            withAnimation(.linear){
                heightLevels = vm.makeRandomLevels(arraySize: cellSize)
            }
        }
    }
}
struct SpotifyChallenge_Previews: PreviewProvider {
    static var previews: some View {
        SpotifyChallenge(vm: ChallengeViewModel())
    }
}
extension SpotifyChallenge{
    private func equalizerCell(heightLevel: CGFloat) -> some View{
        ZStack(){
            Color.green
            Color.black
                .padding(.bottom, heightLevel)
        }.frame(width: 20, height: 100)
    }
}
