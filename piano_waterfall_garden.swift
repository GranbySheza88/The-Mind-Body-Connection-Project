import UIKit

//1
class MindBodyConnection {

    //2
    var body: Body
    var mind: Mind
    
    //3
    init(body: Body, mind: Mind) {
        self.body = body
        self.mind = mind
    }
    
    //4
    func connectMindToBody() {
        //5
        self.body.setBrainActivity(activity: mind.getBrainActivity())
        //6
        self.mind.setPulseRate(pulseRate: body.getPulseRate())
        self.mind.setBreathingRate(breathingRate: body.getBreathingRate())
        //7
        self.body.setThoughtPatterns(patterns: mind.getThoughtPatterns())
    }
    
    //8
    func disconnectMindFromBody() {
        //9
        self.mind.setBrainActivity(activity: nil)
        //10
        self.body.setPulseRate(pulseRate: nil)
        self.body.setBreathingRate(breathingRate: nil)
        //11
        self.mind.setThoughtPatterns(patterns: nil)
    }
    
    //12
    func getMindBodyConnectionInformation() -> (body: Body, mind: Mind) {
        return (body: self.body, mind: self.mind)
    }

}

//13
class Body {
    
    //14
    var brainActivity: Float?
    var pulseRate: Int?
    var breathingRate: Int?
    
    //15
    func setBrainActivity(activity: Float?) {
        self.brainActivity = activity
    }
    
    //16
    func setPulseRate(pulseRate: Int?) {
        self.pulseRate = pulseRate
    }
    
    //17
    func setBreathingRate(breathingRate: Int?) {
        self.breathingRate = breathingRate
    }
    
    //18
    func getBrainActivity() -> Float? {
        return self.brainActivity
    }
    
    //19
    func getPulseRate() -> Int? {
        return self.pulseRate
    }
    
    //20
    func getBreathingRate() -> Int? {
        return self.breathingRate
    }
    
}

//21
class Mind {
    
    //22
    var thoughtPatterns: [String]?
    var brainActivity: Float?
    
    //23
    func setThoughtPatterns(patterns: [String]?) {
        self.thoughtPatterns = patterns
    }
    
    //24
    func setBrainActivity(activity: Float?) {
        self.brainActivity = activity
    }
    
    //25
    func getThoughtPatterns() -> [String]? {
        return self.thoughtPatterns
    }
    
    //26
    func getBrainActivity() -> Float? {
        return self.brainActivity
    }
    
    //27
    func setPulseRate(pulseRate: Int?) {
        self.pulseRate = pulseRate
    }
    
    //28
    func setBreathingRate(breathingRate: Int?) {
        self.breathingRate = breathingRate
    }
    
    //29
    func getPulseRate() -> Int? {
        return self.pulseRate
    }
    
    //30
    func getBreathingRate() -> Int? {
        return self.breathingRate
    }
    
}

//31
class MindBodyConnector {
    
    //32
    var mindBodyConnection: MindBodyConnection?
    
    //33
    init(mindBodyConnection: MindBodyConnection?) {
        self.mindBodyConnection = mindBodyConnection
    }
    
    //34
    func connectMindToBody() {
        self.mindBodyConnection?.connectMindToBody()
    }
    
    //35
    func disconnectMindFromBody() {
        self.mindBodyConnection?.disconnectMindFromBody()
    }
    
    //36
    func getMindBodyConnectionInformation() -> (body: Body, mind: Mind)? {
        return self.mindBodyConnection?.getMindBodyConnectionInformation()
    }
    
}

//37
class MindBodyConnectionManager {
    
    //38
    var mindBodyConnector: MindBodyConnector?
    var mindBodyConnections: [MindBodyConnection]
    
    //39
    init(mindBodyConnector: MindBodyConnector?, mindBodyConnections: [MindBodyConnection]) {
        self.mindBodyConnector = mindBodyConnector
        self.mindBodyConnections = mindBodyConnections
    }
    
    //40
    func makeConnection(body: Body, mind: Mind) {
        let mbc = MindBodyConnection(body: body, mind: mind)
        self.mindBodyConnector?.connectMindToBody()
        self.mindBodyConnections.append(mbc)
    }
    
    //41
    func deleteConnection(body: Body, mind: Mind) {
        for (index, connection) in self.mindBodyConnections.enumerated() {
            if connection.body == body && connection.mind == mind {
                self.mindBodyConnector?.disconnectMindFromBody()
                self.mindBodyConnections.remove(at: index)
            }
        }
    }
    
    //42
    func getMindBodyConnectionInformation() -> [(body: Body, mind: Mind)]? {
        var connectionInfo = [(body: Body, mind: Mind)]()
        for connection in self.mindBodyConnections {
            if let info = self.mindBodyConnector?.getMindBodyConnectionInformation() {
                connectionInfo.append(info)
            }
        }
        return connectionInfo
    }
    
}