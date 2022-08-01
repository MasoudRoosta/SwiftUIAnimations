//
//  ChallengeViewModel.swift
//  SwiftUITestApp
//
//  Created by Masoud Roosta on 8/1/22.
//

import Foundation
import SwiftUI

class ChallengeViewModel: ObservableObject{
    //MARK: - Soptify
    /// generate array of random cgFloat numbers
    /// - Parameter arraySize: index of array
    /// - Returns: cgFloat array with random values
    func makeRandomLevels(arraySize: Int) -> [CGFloat]{
        guard arraySize > 0 else{
            return [CGFloat]()
        }
        let arr = Array(repeating: 0, count: arraySize)
        return arr.map { _ in
            CGFloat.random(in: 0...100)
        }
    }
    
    //MARK: - Airdrop
    @Published var processStatus : String = "Waiting..."
    @Published var processStatusOpacity: Double = 1.0
    @Published var fill: CGFloat = 0.0
    @Published var processStatusColor: Color = .secondary
    
    
    /// make Airdrop custom animation
    func startAnimating(){
        withAnimation(.easeInOut(duration: 0.5)){
            self.processStatusOpacity = 0.0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            withAnimation(.easeInOut(duration: 0.5)){
                self.processStatusOpacity = 1.0
            }
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            withAnimation(.easeInOut(duration: 0.5)){
                self.processStatusOpacity = 0.0
            }
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
            withAnimation(.easeInOut(duration: 0.5)){
                self.processStatusOpacity = 1.0
            }
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.2) {
                for i in 0...100{
                    DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(i/10)) {
                        self.fill = (CGFloat(i/10))/10
                        self.processStatus = "Sending \(Int(self.fill * 100.0))%"
                        self.processStatusColor = .primary
                        if i == 100{
                            self.processStatus = "Sent"
                            self.processStatusColor = .blue
                        }
                    }
                }
            }

    }
}
