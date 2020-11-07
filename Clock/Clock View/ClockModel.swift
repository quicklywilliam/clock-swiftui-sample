
import Foundation

struct ClockModel {
    var hours: Int
    var minutes: Int
    var seconds: Int
    
    init(birthdate: Date) {
        let timeIntervalSinceBirth = Date().timeIntervalSince(birthdate)
        let lifeTimeInterval: TimeInterval = 90 * 365 * 24 * 60 * 60

        let lifePercent = timeIntervalSinceBirth / lifeTimeInterval
        let wakeUpSecond: TimeInterval = 7 * 3600
        let currentSeconds: TimeInterval = wakeUpSecond + (lifePercent * 16 * 3600)
        
        let hours = floor(currentSeconds/3600)
        let minutes = floor((currentSeconds - hours*3600) / 60)
        let seconds = floor(currentSeconds - hours*3600 - minutes*60)
        
        self.hours = Int(hours)
        self.minutes = Int(minutes)
        self.seconds = Int(seconds)
    }
}
