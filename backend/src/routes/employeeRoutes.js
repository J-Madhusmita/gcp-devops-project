import express from "express";
import { getEmployees, addEmployee } from "../controllers/employeeController.js";
import { authenticate } from "../middleware/authMiddleware.js";

const router = express.Router();

router.get("/", authenticate, getEmployees);
router.post("/", authenticate, addEmployee);

export default router;