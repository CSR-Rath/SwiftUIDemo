//
//  SlideShowImage.swift
//  SwiftUIDemo
//
//  Created by Rath! on 24/6/24.
//

import SwiftUI


import SwiftUI

//struct ImageSlideshow: View {
//    // Array of image names
//    let images = ["bg_BG", "bg_choice", "bg_BG", "bg_choice", "bg_BG"]
//    
//    // Current index of the displayed image
//    @State private var currentIndex = 0
//    
//    // Timer to automatically advance the slideshow
//    @State private var timer = Timer.publish(every: 5.0, on: .main, in: .common).autoconnect()
//    
//    var body: some View {
//        VStack {
//            // Display the current image
//            Image(images[currentIndex])
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .onAppear {
//                    // Start the timer when the view appears
//                    startTimer()
//                }
//                .onDisappear {
//                    // Stop the timer when the view disappears
//                    stopTimer()
//                }
//            
//            // Slideshow controls
//            HStack {
//                // Previous button
//                Button(action: {
//                    // Go to the previous image
//                    prevImage()
//                }) {
//                    Image(systemName: "chevron.left")
//                        .font(.title)
//                        .padding()
//                }
//                
//                Spacer()
//                
//                // Next button
//                Button(action: {
//                    // Go to the next image
//                    nextImage()
//                }) {
//                    Image(systemName: "chevron.right")
//                        .font(.title)
//                        .padding()
//                }
//            }
//            .padding()
//        }
//    }
//    
//    // Function to advance to the next image
//    func nextImage() {
//        currentIndex = (currentIndex + 1) % images.count
//    }
//    
//    // Function to go to the previous image
//    func prevImage() {
//        currentIndex = (currentIndex - 1 + images.count) % images.count
//    }
//    
//    // Function to start the timer
//    func startTimer() {
//        timer = Timer.publish(every: 5.0, on: .main, in: .common).autoconnect()
//    }
//    
//    // Function to stop the timer
//    func stopTimer() {
//        timer.upstream.connect().cancel()
//    }
//}



import SwiftUI

struct ImageSlideshow: View {
    // Array of image names
    let images = ["img_slide1", "img_slide2", "img_slide3", "img_slide4"]
    
    // Current index of the displayed image
    @State private var currentIndex = 0
    
    // Timer to handle the auto-animation
    private let timer = Timer.publish(every: 5.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(images.indices, id: \.self) { index in
                Image(images[index])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .clipped()
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
//        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
//        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
//        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        .onReceive(timer) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % images.count
            }
        }
    }
}
