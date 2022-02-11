//
//  ContentView.swift
//  Example
//
//  Created by Sam Deane on 27/01/2022.
//

import FastList
import SwiftUI

@Sendable func refresh() async {
    print("refreshing")
    try? await Task.sleep(nanoseconds: 2000000000)
    print("done")
}

struct TestItem: Identifiable {
    let id = UUID().uuidString
}

let testItems = (1..<100).map({ _ in TestItem() })


enum Tab: Int {
    case list
    case searchable
    case navigation
    case builtIn
}

struct ContentView: View {
    @AppStorage("tab") var tab: Tab = .list
    
    var body: some View {
        TabView(selection: $tab) {
            ExampleList()
                .tabItem {
                    Label("List", systemImage: "tag")
                }
                .tag(Tab.list)
            
            ExampleSearchable()
                .tabItem {
                    Label("Searchable", systemImage: "tag")
                }
                .tag(Tab.searchable)

            ExampleInNavigationView()
                .tabItem {
                    Label("Navigation", systemImage: "tag")
                }
                .tag(Tab.navigation)

            NormalList()
                .tabItem {
                    Label("Built-In List", systemImage: "tag")
                }
                .tag(Tab.builtIn)
        }
        .padding()
    }
}

struct ExampleList: View {
    var body: some View {
        FastList(testItems) { item in
            Text(item.id)
        }
        .refreshable(action: refresh)
    }
}

struct ExampleInNavigationView: View {
    var body: some View {
        NavigationView {
            FastList(testItems, mode: .navigation) { item in
                Text(item.id)
            }
            .refreshable(action: refresh)
            .navigationTitle("Navigation")
            .navigationBarTitleDisplayMode(.large)
            
            Text("Placeholder")
        }
        .navigationViewStyle(.stack)
    }
}


struct ExampleSearchable: View {
    @State var filter = ""
    
    var body: some View {
        NavigationView {
            FastList(testItems, mode: .searchableNavigation) { item in
                Text(item.id)
            }
            .refreshable(action: refresh)
            .navigationTitle("Navigation")
            .navigationBarTitleDisplayMode(.large)
            
            Text("Placeholder")
        }
        .navigationViewStyle(.stack)
        .searchable(text: $filter, placement: .navigationBarDrawer(displayMode: .always))
    }
}

struct NormalList: View {
    @State var filter = ""
    var body: some View {
        NavigationView {
        List {
            ForEach(testItems) { item in
                Text("\(item.id)")
            }
        }
        .listStyle(.plain)
        .refreshable(action: refresh)
        }
        .searchable(text: $filter, placement: .navigationBarDrawer(displayMode: .always))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
