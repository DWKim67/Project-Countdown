import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Button(action: {
                // menu action
            }) {
                Image(systemName: "line.horizontal.3")
                    .font(.title)
                    .foregroundColor(.white)
            }

            Spacer()

            Button(action: {
                // sheet action
            }) {
                Image(systemName: "questionmark.text.page")
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(Color.black)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .preferredColorScheme(.dark)
    }
}
