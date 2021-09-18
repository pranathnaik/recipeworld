const functions = require("firebase-functions");
const admin=require ('firebase-admin');
admin.initializeApp();

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

exports.onCreateFollower = functions
                .firestore
                .document("/followers/{userId}/userFollowers/{followerId}")
                .onCreate(async (snapshot,context)=>{
                const userId= context.params.userId;
                const followerId =context.params.followerId;

                //getting followerd user ppost
                const followedUserPostRef =admin
                .firestore()
                .collection('posts')
                .doc(userId)
                .collection(userPosts);
            
                const timeLinePostRef = admin
                .firestore()
                .collection('timeline')
                .doc(followerId)
                .collection('timelinePost');

                //GETTING followed user post
                const querySnapshot =await followedUserPostRef.get();

                //adding each post to followingtimeline
                querySnapshot.forEach(doc =>{
                    if(doc.exists){
                        const postId=doc.id;
                        const postData= doc.data();
                        timeLinePostRef.doc(postId).set(postData);
                    }
                })
            })