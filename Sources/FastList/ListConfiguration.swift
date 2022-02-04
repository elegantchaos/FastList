// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 04/02/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation
import RefreshableScrollView

public struct ListConfiguration {
    public let showInitialDivider: Bool
    public let showDividers: Bool // TODO: can this be read from the environment?
    public let scrollMode: RefreshableScrollMode

    public init(showInitialDivider: Bool, showDividers: Bool, scrollMode: RefreshableScrollMode) {
        self.showInitialDivider = showInitialDivider
        self.showDividers = showDividers
        self.scrollMode = scrollMode
    }
}
