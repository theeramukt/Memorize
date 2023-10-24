
import SwiftUI

let animalEmojis = ["🐱", "🐶", "🐹", "🦊", "🐼", "🦖", "🦭", "🐬"] + ["🐱", "🐶", "🐹", "🦊", "🐼", "🦖", "🦭", "🐬"]
let foodEmojis = ["🍱", "🍝", "🥘", "🍔", "🌮", "🍖", "🍕", "🍘"] + ["🍱", "🍝", "🥘", "🍔", "🌮", "🍖", "🍕", "🍘"]
let vehicleEmojis = ["🚒", "🚖", "🚲", "🚂", "🛵", "🚀", "🛸", "✈️"] + ["🚒", "🚖", "🚲", "🚂", "🛵", "🚀", "🛸", "✈️"]

struct ContentView: View {
    @State var cardCount = 16
    
    @State var currentTheme = animalEmojis
    var body: some View {
        VStack{
            Text("Memorize!").font(.system(size: 36)).bold()
            ScrollView {
                cards
            }
            themeAdjusters
        }
        .padding()
    }
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: currentTheme[index])
                    .aspectRatio(27/40, contentMode: .fit)
            }
        }
        .foregroundColor(.pink)
    }
    var themeAdjusters: some View {
        HStack{
            Spacer()
            animalsTheme
            Spacer()
            foodsTheme
            Spacer()
            vehicleTheme
            Spacer()
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    var animalsTheme: some View {
        Button(action: {
            currentTheme = animalEmojis.shuffled()
        }) {
            VStack{
                Image(systemName: "pawprint.circle.fill")
                Text("Animals").font(.system(size: 20))
            }
        }
    }
    var foodsTheme: some View {
        Button(action: {
            currentTheme = foodEmojis.shuffled()
        }) {
            VStack{
                Image(systemName: "fork.knife.circle.fill")
                Text("Foods").font(.system(size: 20))
            }
        }
    }
    var vehicleTheme: some View {
        Button(action: {
            currentTheme = vehicleEmojis.shuffled()
        }) {
            VStack{
                Image(systemName: "car.circle.fill")
                Text("Vehicles").font(.system(size: 20))
            }
        }
    }
    
    struct CardView: View {
        let content: String
        @State var isFaceUp: Bool = false
        
        var body: some View {
            ZStack{
                let base = RoundedRectangle(cornerRadius: 12)
                Group {
                    base.foregroundColor(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(content).font(.largeTitle)
                }.opacity(isFaceUp ? 1 : 0)
                base.opacity(isFaceUp ? 0 : 1)
            }
            .onTapGesture {
                isFaceUp.toggle()
            }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
