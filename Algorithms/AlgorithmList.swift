import SwiftUI

struct AlgorithmList: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Leveshtein Distance", value: Destination.levnshtein)
            }.navigationDestination(for: Destination.self) { value in
                switch value {
                case .levnshtein:
                    LevenshteinAlgorithmView()
                }
            }
            .navigationBarTitle("Algorithms", displayMode: .large)
        }
        .preferredColorScheme(.light)
    }
}


