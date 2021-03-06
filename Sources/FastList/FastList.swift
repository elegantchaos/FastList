// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 21/01/2022.
//  All code (c) 2022 - present day, Elegant Chaos.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import RefreshableScrollView
import SwiftUI

public struct FastList<Data, Content>: View where Data: RandomAccessCollection, Content: View, Data.Element: Identifiable {
    @Environment(\.refresh) private var refreshAction
    
    let data: Data
    let configuration: ListConfiguration
    let content: (Data.Element) -> Content
    

    public init(_ data: Data, mode: RefreshableScrollMode = .normal, @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self.data = data
        self.content = content
        self.configuration = .init(showInitialDivider: true, showDividers: true, scrollMode: mode)
    }

    public init(_ data: Data, configuration: ListConfiguration, @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self.data = data
        self.content = content
        self.configuration = configuration
    }

    public var body: some View {
        RefreshableScrollView(mode: configuration.scrollMode) {
            InnerListView(data: data, configuration: configuration, content: content)
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
