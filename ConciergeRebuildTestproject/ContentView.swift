//
//  ContentView.swift
//  ConciergeRebuildTestproject
//
//  Created by robin tetley on 20/04/2023.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        ScrollViewReader { value in
//            ScrollView(.horizontal) {
//                LazyHStack(alignment: .center, spacing: 10) {
//                    ForEach(1...100, id: \.self) {
//                        Text("Column \($0)")
//                    }
//                }
//            }
//            .onAppear {
//                value.scrollTo(67, anchor: .center)
//            }
//
//        }
//    }
//}

struct ContentView: View {
    @State private var isShowingCrew = false
    @State private var currentIndex = 0
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
             //   VStack {
                    ScrollViewReader { scrollView in
                        ScrollView(.horizontal) {
                            LazyHStack {
                                ForEach(1...100, id: \.self) {index in
                                    TestView(viewNumber: index)
                                        .frame(width: geo.size.width - 100, height: geo.size.height - 50)
                                        .id(index)
                                }
                            }
                        }
                        HStack {
                            Button(action: {
                                withAnimation {
                                    currentIndex = (currentIndex == 0) ? currentIndex + 0 : currentIndex - 1
                                    scrollView.scrollTo(currentIndex,anchor: .leading)
                                }
                               }) {
                                   Image(systemName: "arrowtriangle.backward.circle")
                                       .font(.system(size: 50))
                                       .foregroundColor(.black)
                               }
                            Button(action: {
                                   withAnimation {
                                       currentIndex = (currentIndex == 0) ? currentIndex + 2 : currentIndex + 1
                                       scrollView.scrollTo(currentIndex,anchor: .leading)
                                   }
                               }) {
                                   Image(systemName: "arrowtriangle.forward.circle")
                                       .font(.system(size: 50))
                                       .foregroundColor(.black)
                               }
                           
    //                        .onAppear {
    //                            scrollView.scrollTo(99, anchor: .center)
    //                        }
                            
                            
                            //.frame(maxWidth: 300)
                            .navigationBarItems(trailing: Toggle(isOn: $isShowingCrew, label: {
                                Text("Crew")
                            }))
                            
                            .navigationBarTitle("Moonshot")
                        .navigationBarTitleDisplayMode(.inline)
                        }
                       
                    }
                    
              //  }
            }
            
        }
    }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
