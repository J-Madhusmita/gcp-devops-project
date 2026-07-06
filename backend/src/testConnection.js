import pool from "./config/database.js";

async function test() {
  try {
    const connection = await pool.getConnection();

    console.log("✅ Database Connected Successfully");

    const [rows] = await connection.query("SELECT NOW() AS time");

    console.log(rows);

    connection.release();
    process.exit(0);
  } catch (err) {
    console.error(err);
    process.exit(1);
  }
}

test();