
const {onSchedule} = require("firebase-functions/v2/scheduler");
const { onDocumentUpdated, onDocumentCreated } = require("firebase-functions/v2/firestore");
const admin = require('firebase-admin');
const analytics = require("firebase-functions/v1/analytics");
admin.initializeApp();
const fs = admin.firestore();

function updateTask(type, step, uid, doc = null){

  if(doc != null){
    dailyTask = doc.collection("dailyTask");
    weeklyTask = doc.collection("weeklyTask");
  }else{
    dailyTask = fs.collection("user").doc(uid).collection("dailyTask");
    weeklyTask = fs.collection("user").doc(uid).collection("weeklyTask")
  }

  if(type != "get_point"){
    dailyTask.doc(type).update({isComplete: true});
    addPoint(uid, 1);
  }
  if(type != "box"){
    (taskDoc = weeklyTask.doc(type)).update({progress: admin.firestore.FieldValue.increment(step)});
  
    if (taskDoc.get("progress") == taskDoc.get("step")){
      taskDOc.update({isComplete: true})
      addPoint(uid, taskDoc.get("point"));
    }
  }
  
}


// userにポイント追加
async function addPoint(uid, point){
  const doc = fs.collection("user").doc(uid);

  const docRef = await doc.get();
  const token = docRef.get("fcmToken");
  // const previousPoint = docRef.get("point");
  // const PreviousCumulativePoint = docRef.get("cumulativePoint");

  console.log(`fcmtoken:${token}`);

  doc.update({
    point: admin.firestore.FieldValue.increment(point),
    cumulativePoint: admin.firestore.FieldValue.increment(point),
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
  console.log("通知送信");
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

// デイリータスクリセット
exports.dailyTaskReset = onSchedule(
  {
    schedule: "every day 00:00",
    timeZone: "Asia/Tokyo",
    region: "asia-northeast2"
  },
  async (event) => {
    const snapshot = await fs.collection("user").get();
    snapshot.forEach(async (userDoc) => {
      const dailyTaskSnapshot = await userDoc.ref.collection("dailyTask").get();
      dailyTaskSnapshot.forEach(taskDoc => {
        taskDoc.ref.update({ isComplete: false });
      });
    });
  }
);

// ウィークリータスクリセット
exports.weeklyTaskReset = onSchedule(
  {
    schedule: "0 0 * * 0",
    timeZone: "Asia/Tokyo",
    region: "asia-northeast2"
  },
  async (event) => {
    const snapshot = await fs.collection("user").get();
    snapshot.forEach(async (userDoc) => {
      const dailyTaskSnapshot = await userDoc.ref.collection("weeklyTask").get();
      dailyTaskSnapshot.forEach(taskDoc => {
        taskDoc.ref.update({
          isComplete: false,
          progress: 0,
        });
      });
    }); 
  }
);

// ユーザー投稿のトリガー関数
exports.trashPost = onDocumentCreated(
  {
    document: "post/{postId}", 
    region: "asia-northeast2",
  },
  (event) => {
    const userId = event.data.data()["uid"];
    const point = event.data.data()["point"];

    console.log(`UID:${userId}, 獲得ポイント:${point}`);

    // ユーザーにポイント追加
    addPoint(userId, point);
    updateTask("post", 1, userId);
  },
);

// ユーザー登録のトリガー関数
exports.userRegister = onDocumentCreated(
  {
    document: "user/{userId}", 
    region: "asia-northeast2",
  },
  (event) => {
    const userId = event.data.data()["uid"];

    doc = fs.collection("user").doc(userId);
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
  },
);


// exports.userLogin = analytics.event("login")
//   .onLog(
//     async (event) => {
//     const uid = event.data.params["uid"]; 

//     if (!uid) {
//       console.log("No userId found in the analytics event. Event data:", JSON.stringify(event.data));
//       return;
//     }

//     const userDocRef = fs.collection("user").doc(uid);
//     const loginTaskRef = userDocRef.collection("dailyTask").doc("login");

//     try {
//       const loginSnap = await loginTaskRef.get();

//       if (!loginSnap.exists) {
//         console.log(`User ${uid} のデイリータスク 'login' が存在しません。`);
//         return;
//       }

//       const taskData = loginSnap.data();
//       const isComplete = taskData.isComplete;

//       if (isComplete === false) {
//         console.log(`User ${uid} のログインデイリータスクを更新します。`);
//         updateTask("login", 1, uid, userDocRef);
//       } else {
//         console.log(`User ${uid} は既にログインデイリータスクを完了しています。`);
//       }
//     } catch (error) {
//       console.error(`User ${uid} のログイン処理中にエラーが発生しました:`, error);
//     }
//   });
