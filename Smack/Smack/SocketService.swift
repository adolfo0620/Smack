//
//  SocketService.swift
//  Smack
//
//  Created by adolfo reyes on 11/24/17.
//  Copyright © 2017 adolfo reyes. All rights reserved.
//

import UIKit
import SocketIO


class SocketService: NSObject {
    static let instance = SocketService()

    override init(){
        super.init()
    }
    // TODO: for some reason is not reaching the server
    var socket: SocketIOClient = SocketIOClient(manager: SocketManager(socketURL: URL(string: BASE_URL)!), nsp: "/swift")
    
    
    func establishConnection(){
        print("connected")
        socket.connect()
    }
    
    func closeConnection(){
        socket.disconnect()
    }
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler){
        socket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler){
        socket.on("channelCreated") { (dataArray, ack) in
            print("dataArray has \(dataArray)")
            guard let channelName  = dataArray[0] as? String else { return }
            guard let channelDescription =  dataArray[1] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            print("new channel created \(channelName)")
            let newChannel = Channel(channelTitle: channelName, channelDescription: channelDescription, id: channelId)
            print(newChannel)
            MessageService.instance.channels.append(newChannel)
            
            completion(true)
        }
    }
    
}
