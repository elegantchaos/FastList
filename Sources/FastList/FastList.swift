// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 21/01/2022.
//  All code (c) 2022 - present day, Elegant Chaos.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import RefreshableScrollView
import SwiftUI

public struct FastList<Data, Content>: View where Data: RandomAccessCollection, Content: View, Data.Element: Identifiable {
    @Environment(\.refresh) private var refreshAction

    public var data: Data
    public var content: (Data.Element) -> Content
    
    let scrollMode: RefreshableScrollMode

    public init(_ data: Data, mode: RefreshableScrollMode = .normal, @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self.data = data
        self.content = content
        self.scrollMode = mode
    }
    
    public var body: some View {
        RefreshableScrollView(mode: scrollMode) {
            InnerViewList(data: data, content: content)
        }
    }
}

struct FastList_Previews: PreviewProvider {
    struct Item: Identifiable {
        let id: String = UUID().uuidString
    }
    
    static var previews: some View {
        let stuff = (1..<10000).map({ _ in Item() })
        
        FastList(stuff) { item in
            Text(item.id)
        }
    }
}
