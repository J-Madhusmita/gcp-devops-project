import { useEffect, useState } from "react";
import api from "../services/api";

function EmployeeTable() {

    const [employees, setEmployees] = useState([]);

    async function loadEmployees() {

        try {

            const res = await api.get("/employees");

            setEmployees(res.data.employees);

        } catch (err) {

            console.log(err);

        }

    }

    useEffect(() => {

        loadEmployees();

    }, []);

    return (

        <div>

            <h2>Employees</h2>

            <table border="1" cellPadding="10">

                <thead>

                    <tr>

                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Department</th>
                        <th>Salary</th>

                    </tr>

                </thead>

                <tbody>

                    {employees.map(emp => (

                        <tr key={emp.id}>

                            <td>{emp.id}</td>
                            <td>{emp.name}</td>
                            <td>{emp.email}</td>
                            <td>{emp.department}</td>
                            <td>{emp.salary}</td>

                        </tr>

                    ))}

                </tbody>

            </table>

        </div>

    );

}

export default EmployeeTable;