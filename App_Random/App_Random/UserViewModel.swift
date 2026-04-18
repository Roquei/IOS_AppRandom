import SwiftUI
import Combine

class UserViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var isLoading = false

    func fetchRandomUser() {
        guard let url = URL(string: "https://randomuser.me/api/") else { return }
        
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(RandomUserResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.currentUser = decodedResponse.results.first
                        self.isLoading = false
                    }
                } else {
                    DispatchQueue.main.async { self.isLoading = false }
                }
            }
        }.resume()
    }
}
