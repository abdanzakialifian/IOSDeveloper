import UIKit

class WebSocketDelegate : NSObject, URLSessionWebSocketDelegate {
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        print("WebSocket open")
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        guard let theReason = String(data: reason!, encoding: .utf8) else { return }
        print("WebSocket closed with reason : \(theReason)")
    }
}

let delegate = WebSocketDelegate()
let session = URLSession(configuration: .default, delegate: delegate, delegateQueue: OperationQueue())
let task = session.webSocketTask(with: URL(string: "wss://movies-feed.dicoding.dev")!)

task.resume()

let hello = "Hello from Swift"
let message = URLSessionWebSocketTask.Message.string(hello)

task.send(message, completionHandler: { error in
    if let error = error {
        print("WebSocket sending error : \(error)")
    }
    print("Sending message : \(hello)")
})

task.sendPing(pongReceiveHandler: { error in
    if let error = error {
        print("Ping failed : \(error)")
    }
    print("Send ping")
})

task.receive(completionHandler: { result in
    switch result {
    case let .success(message):
        switch message {
        case let .string(text):
            print("Receive text message: \(text)")
        case let .data(data):
            print("Receive binary message: \(data)")
        default:
            print("Message unformatted")
        }
    case let .failure(error):
        print("Failed to receive message: \(error)")
    }
    
    task.cancel(with: .goingAway, reason: "I'm going away".data(using: .utf8))
})
