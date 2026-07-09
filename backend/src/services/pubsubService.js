import { PubSub } from "@google-cloud/pubsub";

const pubsub = new PubSub({
  projectId: process.env.PROJECT_ID,
});

const topic = pubsub.topic("employee-upload-topic");

export async function publishResumeUploaded(data) {
  const message = Buffer.from(JSON.stringify(data));

  await topic.publishMessage({
    data: message,
  });

  console.log("✅ Pub/Sub message published");
}