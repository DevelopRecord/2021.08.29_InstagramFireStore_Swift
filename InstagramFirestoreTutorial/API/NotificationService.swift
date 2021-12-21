//
//  NotificationService.swift
//  InstagramFirestoreTutorial
//
//  Created by LeeJaeHyeok on 2021/11/05.
//

import Firebase

struct NotificationService {
    
    static func uploadNotification(toUid uid: String, fromUser: User,
                                   type: NotificationType, post: Post? = nil) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        guard uid != currentUid else { return }
        
        let docRef = COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").document()
        
        var data: [String: Any] = ["timestamp": Timestamp(date: Date()),
                                    "uid": currentUid,
                                    "type": type.rawValue,
                                    "id": docRef.documentID,
                                    "userProfileImageUrl": fromUser.profileImageUrl,
                                    "username": fromUser.username]
        
        if let post = post {
            data["postId"] = post.postId
            data["postImageUrl"] = post.imageUrl
        }
        
        docRef.setData(data)
    }
    
    static func fetchNotification(completion: @escaping([Notification]) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").getDocuments {
            Snapshot, _ in
            guard let document = Snapshot?.documents else { return }
            let notifications = document.map({ Notification(dictionary: $0.data()) })
            completion(notifications)
        }
    }
}