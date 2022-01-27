// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 27/01/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

struct InnerViewList<Data, Content>: View where Data: RandomAccessCollection, Content: View, Data.Element: Identifiable {
    @Environment(\.defaultMinListRowHeight) var minHeight
    public var data: Data
    public var content: (Data.Element) -> Content

    var body: some View {
        LazyVStack(alignment: .leading, spacing: 0) {
            Divider()
            
            ForEach(data) { item in
                VStack(alignment: .leading, spacing: 0) {
                    Spacer()
                    content(item)
                    Spacer()
                    Divider()
                }
                .frame(minHeight: minHeight)
            }
        }
            .padding(.horizontal)
            .foregroundColor(.primary)
    }
}
