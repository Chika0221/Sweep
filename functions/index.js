
import {
  onDocumentWritten,
  onDocumentCreated,
  onDocumentUpdated,
  onDocumentDeleted,
  Change,
  FirestoreEvent
} from "firebase-functions/v2/firestore";

exports.mewUserCreateTasks = onDocumentCreated("user/{userId}", (event) => {
    // userの新規登録があったとき
    const snapshot = event.data;
    if (!snapshot) {
        console.log("No data associated with the event");
        return;
    }
    const data = snapshot.data();

    // access a particular field as you would any JS property
    const name = data.displayName;

    data.collection("daily_task").doc("task1").set
});


// まだデプロイしていない