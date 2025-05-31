
const { onDocumentUpdated } = require("firebase-functions/v2/firestore");

function sendNotification(){

}

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

exports.userUpdate = onDocumentUpdated(
  {
    document : "user/{userId}",
    region : "asia-northeast2",
  }, 
  (event) => {
  const newValue = event.data.after.data();
  const previousValue = event.data.before.data();

  if(newValue.point != previousValue.point){

  }

  console.log(newValue.uid);
  console.log(newValue.displayName);
});


// まだデプロイしていない