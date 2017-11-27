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
    let socket: SocketIOClient = SocketManager(socketURL: URL(string: BASE_URL)!, config: [.log(true)]).defaultSocket

    func establishConnection(){
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
    
    func addMessages(messageBody: String, userId: String, ChannelId: String, completion: @escaping CompletionHandler){
        let user = UserDataSerivce.instance
        socket.emit("newMessage", messageBody, userId, ChannelId, user.name, user.avatarName, user.avatarColor)
        completion(true)
    }
    
    func getChatMessage(completion: @escaping CompletionHandler){
        socket.on("messageCreated") { (data, ack) in
            guard let msgBody = data[0] as? String else { return }
            guard let channelId = data[2] as? String else { return }
            guard let userName = data[3] as? String else { return }
            guard let userAvatar = data[4] as? String else { return }
            guard let userAvatarColor = data[5] as? String else { return }
            guard let id = data[6] as? String else { return }
            guard let timestamp = data[7] as? String else { return }
            
            if channelId == MessageService.instance.selectedChannel?.id && AuthService.instance.isLoggedIn {
                let newMessage = Message(message: msgBody, userName: userName, channelId: channelId, userAvatar: userAvatar, userAvatarColor: userAvatarColor, id: id, timeStamp: timestamp)
            
                MessageService.instance.messages.append(newMessage)
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func getTypingUsers(_ comletionHandler: @escaping(_ typgingUser: [String: String])-> Void){
        socket.on("userTypingUpdate") { (data, ack) in
            guard let typingUsers = data[0] as? [String: String] else { return }
            comletionHandler(typingUsers)
        }
    }
    
}
