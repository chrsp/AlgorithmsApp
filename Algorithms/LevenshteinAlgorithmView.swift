import SwiftUI

struct LevenshteinAlgorithmView: View {
    @State private var algorithm: LevenshteinAlgorithmLogic = .init()

    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter filename", text: $algorithm.inputFilename, onCommit: algorithm.computeDistances)
                .padding()
                .background(Color(white: 0.9))
                .cornerRadius(10)
                .padding([.leading, .trailing])
            
            List(algorithm.distances, id: \.0) { file, distance in
                HStack {
                    Text(file).fontWeight(file == algorithm.closestFile?.0 ? .bold : .regular)
                    Spacer()
                    Text("\(distance)").fontWeight(file == algorithm.closestFile?.0 ? .bold : .regular)
                }
                .background(file == algorithm.closestFile?.0 ? Color.green.opacity(0.2) : Color.clear)
            }
        }
        .padding()
        .preferredColorScheme(.light)
    }
}

#Preview {
    LevenshteinAlgorithmView()
}
