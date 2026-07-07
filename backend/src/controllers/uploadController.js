import bucket from "../services/storageService.js";
import pool from "../config/database.js";

export const uploadResume = async (req, res) => {
  try {

    if (!req.file) {
      return res.status(400).json({
        success: false,
        message: "No file uploaded"
      });
    }

    const { id } = req.params;

    const fileName = `resumes/${Date.now()}-${req.file.originalname}`;

    const file = bucket.file(fileName);

    await file.save(req.file.buffer, {
      metadata: {
        contentType: req.file.mimetype
      }
    });

    const fileUrl = `gs://${process.env.BUCKET_NAME}/${fileName}`;

    await pool.query(
      "UPDATE employees SET resume_url=? WHERE id=?",
      [fileUrl, id]
    );

    res.json({
      success: true,
      message: "Resume Uploaded Successfully",
      resume_url: fileUrl
    });

  } catch (err) {

    console.error(err);

    res.status(500).json({
      success: false,
      message: "Upload Failed"
    });

  }
};