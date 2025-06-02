
const { onDocumentUpdated, onDocumentCreated } = require("firebase-functions/v2/firestore");
const admin = require('firebase-admin');
admin.initializeApp();


// userにポイント追加
function addPoint(uid, point){
  const doc = admin.firestore().collection("user").doc(uid);

  const snapshot = doc.get();
  const data = snapshot.data();
  const token = data.fcmToken;
  const previousPoint = data.point;
  const PreviousCumulativePoint = data.cumulativePoint;

  doc.update({
    point: previousPoint + point,
    cumulativePoint: PreviousCumulativePoint + point
  });

  sendPointUpNotification(token, point);
}

// ポイントアップの通知
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

// 通知を送信
function pushToDevice(token, payload){
  admin.messaging().send(payload);
}


// user更新があった場合実行
// exports.userUpdate = onDocumentUpdated(
//   {
//     document : "user/{userId}",
//     region : "asia-northeast2",
//   }, 
//   (event) => {
//     const newValue = event.data.after.data();
//     const previousValue = event.data.before.data();

//     if(newValue.point != previousValue.point){
//       sendPointUpNotification(newValue.fcmToken, (newValue.point - previousValue.point));
//     }
  
// });

// postされたとき
exports.trashPost = onDocumentCreated(
  {
    document: "post/{postId}", 
    region: "asia-northeast2",
  },
  (event) => {
    const userId = event.data.data()["uid"];
    const point = event.data.data()["point"];

    addPoint(userId, point);
  },
);


exports.userRegister = onDocumentCreated(
  {
    document: "user/{userId}", 
    region: "asia-northeast2",
  },
  (event) => {
    const userId = event.data.data()["uid"];

    doc = admin.firestore().collection("user").doc(userId);
    dailyTask = doc.collection("dailyTask");
    dailyTask.doc("login")
      .set({
        isComplete: false,
        name: "ログイン",
        point: 1,
      })
    dailyTask.doc("post")
      .set({
        isComplete: false,
        name: "1回投稿",
        point: 1,
      });
    dailyTask.doc("box")
      .set({
        isComplete: false,
        name: "1回ゴミ捨て",
        point: 1,
      });

    weeklyTask = doc.collection("weeklyTask");
    weeklyTask.doc("login")
      .set({
        isComplete: false,
        name: "5日間ログイン",
        point: 5,
        progress: 0,
        step: 5
      });
    weeklyTask.doc("post")
      .set({
        isComplete: false,
        name: "5回投稿",
        point: 5,
        progress: 0,
        step: 5
      });
    weeklyTask.doc("get_point")
      .set({
        isComplete: false,
        name: "30ポイント獲得",
        point: 5,
        progress: 0,
        step: 30,
      });
});