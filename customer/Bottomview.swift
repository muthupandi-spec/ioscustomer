import SwiftUI

struct Bottomview: View {
    @Environment(\.dismiss) var dismiss // Move @Environment here

    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue.ignoresSafeArea(edges: .all)
              
                    ScrollView {
                        ForEach(0..<100, id: \.self) { _ in
                        Text("Hello from the modal view!")
                            .bold()
                            .foregroundStyle(.white)
                    }}
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) { // Use this instead
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct Bottom_view: PreviewProvider {
    static var previews: some View {
        Bottomview()
    }
}
