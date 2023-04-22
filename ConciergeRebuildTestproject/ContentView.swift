//
//  ContentView.swift
//  ConciergeRebuildTestproject
//
//  Created by robin tetley on 20/04/2023.


import SwiftUI


struct TaskRow: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Skills getting started with iPad")
            Text("2.00pm - 3.00pm")
                .foregroundColor(.secondary)
            Text("Jim Heard")
                .foregroundColor(.secondary)
            HStack {
                Text("6")
                    .fontWeight(.bold)
                Spacer()
                Text("Full")
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct TitleRow: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Spacer()
            Text("Apr")
                .foregroundColor(.secondary)
                .fontWeight(.light)
            HStack {
                Text("Thur")
                    .fontWeight(.bold)
                Image(systemName: "15.circle.fill").foregroundColor(.blue)
                    .fontWeight(.bold)
                    .scaleEffect(1.3)
                Spacer()
                Text("2 Sessions")
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ContentView: View {
    @State private var isShowingCrew = false
    @State private var currentIndex = 0
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ScrollViewReader { scrollView in
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(1...100, id: \.self) { index in
                                List {
                                    Section {
                                        TitleRow()
                                        TaskRow()
                                        TaskRow()
                                        TaskRow()
                                    }
                                }
                                .frame(width: geo.size.width - 50, height: geo.size.height - 50)
                                .id(index)
                                .padding(5)
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
                                .foregroundColor(.secondary)
                        }
                        Button(action: {
                            withAnimation {
                                currentIndex = (currentIndex == 0) ? currentIndex + 2 : currentIndex + 1
                                scrollView.scrollTo(currentIndex,anchor: .leading)
                            }
                        }) {
                            Image(systemName: "arrowtriangle.forward.circle")
                                .font(.system(size: 50))
                                .foregroundColor(.secondary)
                        }
                        .navigationBarItems(trailing: Toggle(isOn: $isShowingCrew, label: {
                            Text("Crew")
                        }))
                        .navigationBarItems(leading: Toggle(isOn: $isShowingCrew, label: {
                            Text("Filter")
                        }))
                        .navigationBarItems(leading: Toggle(isOn: $isShowingCrew, label: {
                            Image(systemName: "magnifyingglass")
                        }))
                        
                        .navigationBarTitle("SouthGate")
                        .navigationBarTitleDisplayMode(.inline)
                    }
                    
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
