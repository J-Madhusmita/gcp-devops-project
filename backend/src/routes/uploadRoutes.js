import express from "express";
import upload from "../middleware/uploadMiddleware.js";
import { authenticate } from "../middleware/authMiddleware.js";
import { uploadResume } from "../controllers/uploadController.js";

const router = express.Router();

router.post(
  "/:id/upload",
  authenticate,
  upload.single("resume"),
  uploadResume
);

export default router;