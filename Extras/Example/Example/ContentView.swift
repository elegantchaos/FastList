//
//  ContentView.swift
//  Example
//
//  Created by Sam Deane on 27/01/2022.
//

import FastList
import SwiftUI

struct TestItem: Identifiable {
    let id = UUID().uuidString
}

let testItems = (1..<100).map({ _ in TestItem() })


struct ContentView: View {
    var body: some View {
        TabView {
            ExampleList()
                .tabItem {
                    Label("List", systemImage: "tag")
                }
            
            ExampleInNavigationView()
                .tabItem {
                    Label("Navigation", systemImage: "tag")
                }
            
            NormalList()
                .tabItem {
                    Label("Built-In List", systemImage: "tag")
                }
        }
        .padding()
    }
}

struct ExampleList: View {
    var body: some View {
        FastList(testItems) { item in
            Text(item.id)
        }
        .refreshable {
            print("refreshing")
            sleep(2)
            print("done")
        }
    }
}

struct ExampleInNavigationView: View {
    var body: some View {
        NavigationView {
            FastList(testItems, mode: .custom(80, 160, false)) { item in
                Text(item.id)
            }
            .refreshable {
                print("refreshing")
                sleep(2)
                print("done")
            }
                .navigationTitle("Navigation")
                .navigationBarTitleDisplayMode(.large)
            
            Text("Placeholder")
        }
        .navigationViewStyle(.stack)
    }
}

struct NormalList: View {
    var body: some View {
        List {
            ForEach(testItems) { item in
                Text("\(item.id)")
            }
        }
        .listStyle(.plain)
        .refreshable {
            print("refreshing")
            sleep(2)
            print("done")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
