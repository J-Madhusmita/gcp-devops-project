import express from "express";
import cors from "cors";
import authRoutes from "./routes/authRoutes.js";
import employeeRoutes from "./routes/employeeRoutes.js";
import uploadRoutes from "./routes/uploadRoutes.js";

const app = express();

app.use(cors());
app.use(express.json());

app.use("/api/auth", authRoutes);
app.use("/api/employees", employeeRoutes);
app.use("/api/employees", uploadRoutes);

app.get("/", (req, res) => {
  res.json({
    success: true,
    message: "EmployeeHub Backend Running 🚀"
  });
});

export default app;