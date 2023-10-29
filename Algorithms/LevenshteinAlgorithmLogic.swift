import Foundation
import Observation

@Observable class LevenshteinAlgorithmLogic {
    var inputFilename: String = ""
    var distances: [(String, Int)] = []
    
    var closestFile: (String, Int)? {
        distances.min(by: { $0.1 < $1.1 })
    }
    
    func levenshteinDistance(from s: String, to t: String) -> Int {
        if s == t { return 0 }
        
        let sChars = Array(s)
        let tChars = Array(t)
        let m = sChars.count
        let n = tChars.count
        
        if m == 0 { return n }
        if n == 0 { return m }
        
        var matrix: [[Int]] = Array(repeating: Array(0...n), count: m + 1)
        for i in 1...m { matrix[i][0] = i }
        
        for i in 1...m {
            for j in 1...n {
                let cost = sChars[i - 1] == tChars[j - 1] ? 0 : 1
                matrix[i][j] = min(
                    matrix[i - 1][j] + 1,
                    matrix[i][j - 1] + 1,
                    matrix[i - 1][j - 1] + cost
                )
            }
        }
        
        return matrix[m][n]
    }
    
    let files = [
        "ListViewController",
        "ListViewModel",
        "DetailViewController",
        "DetailViewModel"
    ]
    
    func computeDistances() {
        distances = files.map { ($0, levenshteinDistance(from: inputFilename, to: $0)) }
    }
}
