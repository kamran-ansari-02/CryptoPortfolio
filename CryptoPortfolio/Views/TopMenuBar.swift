import SwiftUI

struct TopMenuBar: View {
    var body: some View {
        VStack {
            HStack {
                // Left menu button
                Button(action: {
                    print("Menu tapped")
                }) {
                    Image("Menu_Icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 62, height: 62)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                // Right bell button
                Button(action: {
                    print("Bell tapped")
                }) {
                    Image("Notify_Icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 62, height: 62)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            .padding(.top, 0)
            
            Spacer()
        }
    }
}

#Preview {
    TopMenuBar()
}
