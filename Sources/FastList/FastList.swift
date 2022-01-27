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
    
    let refreshHeight: Double
    let activityOffset: CGFloat?

    public init(_ data: Data, refreshHeight: Double = 80, activityOffset: CGFloat? = nil, @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self.data = data
        self.content = content
        self.refreshHeight = refreshHeight
        self.activityOffset = activityOffset
    }
    
    public var body: some View {
        RefreshableScrollView(travelHeight: refreshHeight, activityOffset: activityOffset) {
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
