//
// Copyright © 2021 An Tran. All rights reserved.
//

import Foundation
import SwiftPublicIP
import SwiftUI
import TweakPane

public struct SwiftPublicIPBlade: Blade {
    public var name: String = "Public IP"
    
    public init() {}
    
    public func render() -> AnyView {
        AnyView(ContentView())
    }
}

private struct ContentView: View {
    private let info = Bundle.main.infoDictionary

    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            if let ip = viewModel.ip {
                Text(verbatim: ip)
            }
        }
        .onAppear(perform: viewModel.fetchIP)
    }
}

extension ContentView {
    final class ViewModel: ObservableObject {
        @Published var ip: String?
        
        func fetchIP() {
            SwiftPublicIP.getPublicIP(url: PublicIPAPIURLs.IPv4.icanhazip.rawValue) { [weak self] string, error in
                if let error = error {
                    self?.ip = error.localizedDescription
                } else if let string = string {
                    self?.ip = string
                }
            }
        }
    }
}
