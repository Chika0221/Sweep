
const { onDocumentUpdated, https } = require("firebase-functions/v2/firestore");
const admin = require('firebase-admin');
admin.initializeApp();

// exports.mewUserCreateTasks = onDocumentCreated("user/{userId}", (event) => {
//     // userの新規登録があったとき
//     const snapshot = event.data;
//     if (!snapshot) {
//         console.log("No data associated with the event");
//         return;
//     }
//     const data = snapshot.data();

//     // access a particular field as you would any JS property
//     const name = data.displayName;

//     data.collection("daily_task").doc("task1").set
// });

function sendPointUpNotification(token, point){
  const title = "ポイント獲得";
  const body = `${point} ポイント獲得！`;

  const message = {
    notification: {
      title: title,
      body: body,
    },
    data: {
      title: title,
      body: body,
      point: `${point}`,
    },
    android: {
      notification: {
        sound: "default",
        image: "https://firebasestorage.googleapis.com/v0/b/sweep-dbccd.firebasestorage.app/o/FIAMImages%2Fcoin.png?alt=media&token=ea9c6781-6747-4829-8f71-815b386cd075"
      }
    },
    apns: {
      payload: {
        aps: {
          badge: 1,
          sound: "default",
        },
      },
    },
    token: token
  };
  pushToDevice(token, message);
}

function pushToDevice(token, payload){
  admin.messaging().send(payload);
}

exports.userUpdate = onDocumentUpdated(
  {
    document : "user/{userId}",
    region : "asia-northeast2",
  }, 
  (event) => {
  const newValue = event.data.after.data();
  const previousValue = event.data.before.data();

  if(newValue.point != previousValue.point){
    sendPointUpNotification(newValue.fcmToken, (newValue.point - previousValue.point));
  }
  
});