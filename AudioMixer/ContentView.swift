//
//  ContentView.swift
//  AudioMixer
//
//  Created by Saiful Islam Sagor on 12/12/23.
//

import SwiftUI
import AVKit
import AVFoundation

struct ContentView: View {
    @State var selectedAudioUrl1: URL? = nil
    @State var selectedAudioUrl2: URL? = nil
    @State var isShowingPicker1: Bool = false
    @State var isShowingPicker2: Bool = false
    @State var player1:AVAudioPlayer? = nil
    @State var player2:AVAudioPlayer? = nil
    
    var body: some View {
        VStack {
            Button{
                isShowingPicker1 = true
                player1 = nil
                selectedAudioUrl1 = nil
            }label: {
                Text("Select first Audio")
                    .fontWeight(.heavy)
                    .frame(width: 250,height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
            Button{
                isShowingPicker2 = true
                player2 = nil
                selectedAudioUrl2 = nil
            }label: {
                Text("Select 2nd Audio")
                    .fontWeight(.heavy)
                    .frame(width: 250,height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)

            }
            if self.selectedAudioUrl1 != nil {
                
                Button{
                    do{
                       player1 = try AVAudioPlayer(contentsOf: selectedAudioUrl1!, fileTypeHint: nil)
                        player1!.prepareToPlay()
                        player1!.play()
                    }catch{
                        print(error.localizedDescription)
                    }
                    
                }label: {
                    Text("play1")
                        .fontWeight(.heavy)
                        .frame(width: 100,height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)

                }
            }
            if self.selectedAudioUrl2 != nil {
                
                Button{
                    do{
                       player2 = try AVAudioPlayer(contentsOf: selectedAudioUrl2!, fileTypeHint: nil)
                        player2!.prepareToPlay()
                        player2!.play()
                    }catch{
                        print(error.localizedDescription)
                    }
                    
                }label: {
                    Text("play2")
                        .fontWeight(.heavy)
                        .frame(width: 100,height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)

                }
            }
            

            
        }
        .sheet(isPresented: $isShowingPicker1){
            AudioPicker(selectedAudioUrl: $selectedAudioUrl1, isShowingPicker: $isShowingPicker1)
        }
        .sheet(isPresented: $isShowingPicker2){
            AudioPicker(selectedAudioUrl: $selectedAudioUrl2, isShowingPicker: $isShowingPicker2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
