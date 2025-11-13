import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: String
    let image: String
}

struct AppleProductGrid: View {
    // Sample Data
    let products = [
        Product(name: "iPhone 15 Pro", price: "$999", image: "iphone"),
        Product(name: "MacBook Air M3", price: "$1299", image: "macbook"),
        Product(name: "Apple Watch Ultra 2", price: "$799", image: "watch"),
        Product(name: "AirPods Pro 2", price: "$249", image: "airpods")
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Apple Store")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .padding(.top)
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(products) { product in
                        VStack(spacing: 12) {
                            Image(product.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 140)
                            
                            Text(product.name)
                                .font(.headline)
                                .foregroundColor(.primary)
                            
                            Text(product.price)
                                .foregroundColor(.secondary)
                            
                            Button(action: {}) {
                                Text("Buy")
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 8)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 4)
                        .padding(.horizontal, 10)
                    }
                }
                .padding(.horizontal)
            }
        }
        .background(Color(UIColor.systemBackground))
    }
}

#Preview {
    AppleProductGrid()
}
