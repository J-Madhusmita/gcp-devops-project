import express from "express";
import {
    getEmployees,
    addEmployee,
    updateEmployee,
    deleteEmployee
} from "../controllers/employeeController.js";
import { authenticate } from "../middleware/authMiddleware.js";

const router = express.Router();

router.get("/", authenticate, getEmployees);

router.post("/", authenticate, addEmployee);

router.put("/:id", authenticate, updateEmployee);

router.delete("/:id", authenticate, deleteEmployee);

export default router;