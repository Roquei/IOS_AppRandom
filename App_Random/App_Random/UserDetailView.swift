import SwiftUI

struct UserDetailView: View {
    @ObservedObject var viewModel: UserViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                if let user = viewModel.currentUser {
                    AsyncImage(url: URL(string: user.picture.large)) { image in
                        image.resizable().aspectRatio(contentMode: .fill)
                    } placeholder: { ProgressView() }
                    .frame(width: 140, height: 140).cornerRadius(20).clipped()
                } else {
                    RoundedRectangle(cornerRadius: 20).fill(Color.gray.opacity(0.2)).frame(width: 140, height: 140)
                }
                
                VStack(spacing: 0) {
                    FieldRow(label: "First Name", value: viewModel.currentUser?.name.first)
                    FieldRow(label: "Last Name", value: viewModel.currentUser?.name.last)
                    FieldRow(label: "Age", value: viewModel.currentUser != nil ? "\(viewModel.currentUser!.dob.age)" : nil)
                    FieldRow(label: "Gender", value: viewModel.currentUser?.gender)
                    FieldRow(label: "City", value: viewModel.currentUser?.location.city)
                    FieldRow(label: "Country", value: viewModel.currentUser?.location.country)
                    FieldRow(label: "Phone", value: viewModel.currentUser?.phone)
                }.padding(.horizontal)

                Button(action: { viewModel.fetchRandomUser() }) {
                    HStack {
                        if viewModel.isLoading { ProgressView().tint(.white) }
                        else { Image(systemName: "play.fill"); Text("Gerar") }
                    }
                    .foregroundColor(.white).padding().frame(width: 140).background(Color.black).clipShape(Capsule())
                }.padding(.top, 20)
            }
        }
        .navigationTitle("Gerar")
    }
}

struct FieldRow: View {
    let label: String
    let value: String?
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label).font(.caption2).foregroundColor(.gray).textCase(.uppercase)
            Text(value ?? " ").font(.system(size: 16))
            Divider()
        }.padding(.vertical, 8)
    }
}
