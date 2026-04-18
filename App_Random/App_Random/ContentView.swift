import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = UserViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(uiColor: .systemGray6).ignoresSafeArea()
                VStack(alignment: .leading, spacing: 15) {
                    Text("Random").font(.title3).bold()
                    Text("Gerar dados de pessoas fictícias utilizando random.me API")
                        .font(.subheadline).foregroundColor(.secondary)
                    
                    NavigationLink(destination: UserDetailView(viewModel: viewModel)) {
                        Text("Gerar").frame(maxWidth: .infinity).padding()
                            .background(Color(uiColor: .systemGray5)).cornerRadius(12).foregroundColor(.black)
                    }
                    
                    Button("Lista") { }
                        .frame(maxWidth: .infinity).padding()
                        .background(Color(uiColor: .systemGray5)).cornerRadius(12).foregroundColor(.black)
                    
                    Button("Sair") { exit(0) }.frame(maxWidth: .infinity).foregroundColor(.red)
                }
                .padding(25).background(Color.white).cornerRadius(25).shadow(radius: 5).padding(30)
            }
            .navigationTitle("Home")
        }
    }
}
