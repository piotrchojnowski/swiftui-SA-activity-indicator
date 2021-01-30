//
//  ContentView.swift
//  SA-CustomActivity
//
//  Created by Piotr Chojnowski on 27/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading = false
    
    var body: some View {
        ZStack() {
            Color.blue
                .ignoresSafeArea()
            
            VStack() {
                Spacer()
                HStack(spacing: 50) {
                    Color(.systemIndigo)
                        .cornerRadius(6)
                        .frame(height: 150, alignment: .center)
                    
                    Color(.systemPurple)
                        .cornerRadius(6)
                        .frame(height: 150, alignment: .center)
                }
                
                Spacer()
                
                HStack(spacing: 50) {
                    Color(.systemOrange)
                        .cornerRadius(6)
                        .frame(height: 150, alignment: .center)
                    
                    Color(.systemPink)
                        .cornerRadius(6)
                        .frame(height: 150, alignment: .center)
                }

                Spacer()
                
                Text("Example activity - tap me!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding()
                    .onTapGesture {
                        startFakeTask()
                    }
            }
            
            if isLoading {
                LoadingView()
            }
        }
    }
    
    private func startFakeTask() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            isLoading = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemGray)
                .ignoresSafeArea()
                .opacity(0.9)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .scaleEffect(2)
        }
    }
}
