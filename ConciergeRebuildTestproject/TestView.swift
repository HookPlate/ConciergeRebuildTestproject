//
//  TestView.swift
//  ConciergeRebuild
//
//  Created by robin tetley on 20/04/2023.
//

import SwiftUI

struct TestView: View {
    
    var viewNumber : Int
  //  @State private var offset = CGSize.zero
   // var geo: GeometryProxy
    
    var body: some View {
        
      
        ZStack(alignment: .bottom) {
                Image("ProfilePicture")
                    .resizable()
                    //.aspectRatio(contentMode: .fit)
                   // .scaledToFill()
            
            
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Robin Tetley:")
                            .font(.headline)
                        Text("View \(viewNumber)")
                    }
                    Text("Chief Executive Officer")
                        .font(.subheadline)
                }
                Spacer()
            }
            .padding()
            .foregroundColor(.primary)
            .background(Color.primary
                            .colorInvert()
                            .opacity(0.75))
        }
        .cornerRadius(25)
       // .frame(width: geo.size.width - 100)
    }
}
