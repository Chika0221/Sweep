const {onSchedule} = require("firebase-functions/v2/scheduler");
const { onDocumentUpdated, onDocumentCreated } = require("firebase-functions/v2/firestore");
const {onCall, HttpsError, onRequest } = require("firebase-functions/v2/https");
const admin = require('firebase-admin');
const functionsV1 = require("firebase-functions/v1");
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
    const taskDoc = dailyTask.doc(type);
    taskDoc.update({isComplete: true});
  }
  if(type != "box"){
    (taskDoc = weeklyTask.doc(type)).update({progress: taskDoc.get("progress") + step});
    if (taskDoc.get("progress") >= taskDoc.get("step")){
      taskDoc.update({isComplete: true})
    }
  }
  
}


// userにポイント追加
async function addPoint(uid, point, title = null){

  console.log("ポイント付与");

  const doc = fs.collection("user").doc(uid);

  const docRef = await doc.get();
  const token = docRef.get("fcmToken");

  console.log(`fcmtoken:${token}`);

  doc.update({
    point: admin.firestore.FieldValue.increment(point),
    cumulativePoint: admin.firestore.FieldValue.increment(point),
  });  

  // weeklyタスク更新
  doc.collection("weeklyTask").doc("get_point").update({ 
    progress: admin.firestore.FieldValue.increment(point) 
  });

  sendPointUpNotification(token, point, title);
}

// ポイントアップの通知
function sendPointUpNotification(token, point,title = null){
  if (title == null) {
    title = "ポイント獲得！";
  }
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

    var one = {id:"",point:0};
    var two = {id:"",point:0};
    var three = {id:"",point:0};

    const snapshot = await fs.collection("user").get();
    snapshot.forEach(async (userDoc) => {

      var cumPoint = user.ref.get("cumulativePoint");
      if(cumPoint > one.point){
        three = two;
        two = one;
        one = {id: userDoc.id, point: cumPoint};
      }

      userDoc.ref.update({
        cumulativePoint: 0,
      });
      const dailyTaskSnapshot = await userDoc.ref.collection("weeklyTask").get();
      dailyTaskSnapshot.forEach(taskDoc => {
        taskDoc.ref.update({
          isComplete: false,
          progress: 0,
        });
      });
    }); 

    fs.collection("user").doc(one.id).update({
      point: admin.firestore.FieldValue.increment(20),
    
    });
    addPoint((one.id), 20, "週間ランキング1位！");
    fs.collection("user").doc(two.id).update({
      point: admin.firestore.FieldValue.increment(15),
    });
    addPoint((two.id), 15, "週間ランキング2位！"),

    fs.collection("user").doc(three.id).update({
      point: admin.firestore.FieldValue.increment(10),
      
    });
    addPoint((three.id), 10, "週間ランキング3位！");
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
    addPoint(userId, point,"投稿ポイント");
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

exports.userTaskUpdate = onDocumentUpdated(
  {
    document: "user/{userId}/{userTask}/{taskId}", 
    region: "asia-northeast2",
  },
  (event) => {
    console.log("userUpdate:実行された");
    const beforeValue = event.data.before.data();
    const afterValue = event.data.after.data();
    const uid = event.params.userId;
    const point = afterValue.point;
    if(beforeValue.isComplete == false && afterValue.isComplete == true){
      addPoint(uid,point,"タスク完了！");
    }else{
      console.log("falseです");
    }
  }
);


// exports.userLogin = onCall(
//   {
//     region: "asia-northeast2",
//   },
//   async (event) =>{
//     const uid = event.data.uid; 

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

//       if (isComplete == false) {
//         console.log(`User ${uid} のログインデイリータスクを更新します。`);
//         updateTask("login", 1, uid, userDocRef);
//       } else {
//         console.log(`User ${uid} は既にログインデイリータスクを完了しています。`);
//       }
//     } catch (error) {
//       console.error(`User ${uid} のログイン処理中にエラーが発生しました:`, error);
//     }
//   }
// );

// exports.userLogin = functionsV1.region("asia-northeast2").analytics.event("login").onLog(
//   async (event) => {
//     const uid = event.user.userId;

//     console.log("Login");
//     console.log(`uid: ${uid}`);

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

//       if (isComplete == false) {
//         console.log(`User ${uid} のログインデイリータスクを更新します。`);
//         updateTask("login", 1, uid, userDocRef);
//       } else {
//         console.log(`User ${uid} は既にログインデイリータスクを完了しています。`);
//       }
//     } catch (error) {
//       console.error(`User ${uid} のログイン処理中にエラーが発生しました:`, error);
//     }
//   }
// );


exports.trashReportFromTrashbox = onRequest(
  {
    region: "asia-northeast2",
    cors: false,
  },
  async (request, response) => {
    if (request.method != "POST") {
      response.status(405).send("Method not allowed.");
      return;
    }

    console.log("リクエスト受信");

    const trashBoxId = request.headers["id"];
    const contentType = request.headers["content-type"];
    const queryType = request.query["type"];

    if (!trashBoxId) {
      response.status(400).send("id is missing.");
      return;
    } else if (contentType != "application/json") {
      response.status(400).send("Content-Type must be application/json.");
      return;
    }

    const trashBoxDoc = fs.collection("trashBox").doc(trashBoxId);

    const docSnapshot = await trashBoxDoc.get();
    if (!docSnapshot.exists) {
      response.status(400).send("TrashBoxId does not exist.");
      return;
    }

    const requestBody = request.body;

    switch (queryType) {
      case "discard": {
        const uid = requestBody["uid"];
        const weight = requestBody["weight"];
        const boxWeight = requestBody["boxWeight"];
        console.log(`Request Body uid: ${uid}  weight: ${weight}  boxWeight: ${boxWeight}`);
        const discardId = crypto.randomUUID();
        fs.collection("discard").doc(discardId).set({
          discardId: discardId,
          time: new Date(),
          uid: uid,
          weight: weight
        });
        
        trashBoxDoc.update({weight: boxWeight});

        addPoint(uid, 1,"ゴミ捨て完了");
        updateTask("box", 1, uid);
    
        break;
      }
      case "state": {

        const boxWeight = requestBody["boxWeight"];
    
        trashBoxDoc.update({weight: boxWeight});
        break;
      }
      default:
        response.status(400).send("query is missing.");
        return;
    }

    response.status(200).send("successful!");
  }
);



