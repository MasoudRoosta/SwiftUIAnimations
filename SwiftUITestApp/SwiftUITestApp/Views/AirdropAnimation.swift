//
//  AirdropAnimation.swift
//  SwiftUITestApp
//
//  Created by Masoud Roosta on 8/1/22.
//

import SwiftUI

struct AirdropAnimation: View {
    @StateObject var vm: ChallengeViewModel
    var body: some View {
        VStack(spacing: 8){
            uploadeCircle(uploadPercent: vm.fill)
                .onAppear {
                    vm.startAnimating()
                }
            titleSection
            uploadStatus(processStatus: vm.processStatus, processStatusColor: vm.processStatusColor, processStatusOpacity: vm.processStatusOpacity)
        }
        
    }
}

struct AirdropAnimation_Previews: PreviewProvider {
    static var previews: some View {
        AirdropAnimation(vm: ChallengeViewModel())
    }
}

extension AirdropAnimation{
    private func uploadeCircle(uploadPercent: CGFloat) -> some View{
        ZStack{
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.secondary)
                .padding(8)
            Circle()
                .stroke(Color.secondary, style: StrokeStyle(lineWidth: 8, lineCap: .round))
            
            Circle()
                .trim(from: 0.0, to: uploadPercent)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .rotationEffect(.init(degrees: -90))
        }
        .frame(width: 200, height: 200)
        
    }
    private var titleSection: some View{
        Text("iPhone")
            .font(.title2)
            .fontWeight(.semibold)
    }
    private func uploadStatus(processStatus: String, processStatusColor: Color, processStatusOpacity: Double) -> some View{
        Text(processStatus)
            .font(.headline)
            .fontWeight(.semibold)
            .frame(height: 32)
            .frame(maxWidth: .infinity)
            .foregroundColor(processStatusColor.opacity(processStatusOpacity))
    }
}
