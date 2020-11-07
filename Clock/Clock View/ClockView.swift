
import SwiftUI
import Combine

struct ClockView : View {
    @State(initialValue: ClockModel(birthdate: ISO8601DateFormatter().date(from:"1984-10-28T00:00:00+0000") ?? Date()))
    var time: ClockModel
    
    let showsSeconds: Bool
    
    @State
    private var timerSubscription: Cancellable? = nil
    
    private let hourPointerBaseRadius: CGFloat = 0.1
    
    private let secondPointerBaseRadius: CGFloat = 0.05
    
    var body: some View {
        GeometryReader { metrics in

            ZStack {
                Circle().fill(Color.black).opacity(0.15)
                showsSeconds ? Circle().stroke(Color.primary) : nil
                ClockMarks().padding(1)
                ClockMonogram(monogram: "LIFE")
                ClockIndicator(type: .hour, time: time).complicationForeground()
                ClockIndicator(type: .minute, time: time).complicationForeground()
                showsSeconds ? nil : Circle().fill(Color.white).frame(width: metrics.size.height * 0.14, height: metrics.size.height * 0.14, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).complicationForeground()
                showsSeconds ? nil : Circle().fill(Color.black).frame(width: metrics.size.height * 0.08, height: metrics.size.height * 0.08, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                showsSeconds ? ClockIndicator(type: .second, time: time) : nil
            }
        }
        .padding(2)
        .aspectRatio(1, contentMode: .fit)
        .onAppear { self.subscribe() }
        .onDisappear { self.unsubscribe() }
    }
    
    private func subscribe() {
        timerSubscription =
            Timer.publish(every: 3600*12, on: .main, in: .common)
            .autoconnect()
            .map(ClockModel.init)
            .assign(to: \.time, on: self)
    }
    
    private func unsubscribe() {
        timerSubscription?.cancel()
    }
}
