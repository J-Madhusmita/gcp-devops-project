import pool from "../config/database.js";

export const getEmployees = async (req, res) => {

    try {

        const [employees] = await pool.query(
            "SELECT * FROM employees ORDER BY id DESC"
        );

        res.json({
            success: true,
            employees
        });

    } catch (err) {

        console.error(err);

        res.status(500).json({
            success: false,
            message: "Server Error"
        });

    }

};


export const addEmployee = async (req, res) => {
  try {

    const { name, email, department, salary } = req.body;

    if (!name || !email) {
      return res.status(400).json({
        success: false,
        message: "Name and Email are required"
      });
    }

    const [existing] = await pool.query(
      "SELECT id FROM employees WHERE email=?",
      [email]
    );

    if (existing.length > 0) {
      return res.status(400).json({
        success: false,
        message: "Employee already exists"
      });
    }

    await pool.query(
      `INSERT INTO employees
      (name,email,department,salary)
      VALUES(?,?,?,?)`,
      [name, email, department, salary]
    );

    res.status(201).json({
      success: true,
      message: "Employee Added Successfully"
    });

  } catch (err) {

    console.error(err);

    res.status(500).json({
      success: false,
      message: "Server Error"
    });

  }
};


export const updateEmployee = async (req, res) => {
    try {

        const { id } = req.params;
        const { name, email, department, salary } = req.body;

        const [result] = await pool.query(
            `UPDATE employees
             SET name=?, email=?, department=?, salary=?
             WHERE id=?`,
            [name, email, department, salary, id]
        );

        if (result.affectedRows === 0) {
            return res.status(404).json({
                success: false,
                message: "Employee not found"
            });
        }

        res.json({
            success: true,
            message: "Employee Updated Successfully"
        });

    } catch (err) {
        console.error(err);

        res.status(500).json({
            success: false,
            message: "Server Error"
        });
    }
};


export const deleteEmployee = async (req, res) => {

    try {

        const { id } = req.params;

        const [result] = await pool.query(
            "DELETE FROM employees WHERE id=?",
            [id]
        );

        if (result.affectedRows === 0) {
            return res.status(404).json({
                success: false,
                message: "Employee not found"
            });
        }

        res.json({
            success: true,
            message: "Employee Deleted Successfully"
        });

    } catch (err) {

        console.error(err);

        res.status(500).json({
            success: false,
            message: "Server Error"
        });

    }

};