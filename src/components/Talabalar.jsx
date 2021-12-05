import * as React from 'react';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';
import {Link} from 'react-router-dom'

export default function Talabalar(props) {

  return (
    <TableContainer component={Paper}>
      <Table sx={{ minWidth: 650 }} aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell >Talaba ismi</TableCell>
            <TableCell align="right">Talaba familiyasi</TableCell>
            <TableCell align="right">Telefon raqami</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {props.students?.map((row) => (
            <TableRow
              key={row.user_id}
              sx={{ '&:last-child td, &:last-child th': { border: 0 } }}
            >
            <Link to={`/student/${row.user_id}`}>
              <TableCell component="th" scope="row" style={{cursor: 'pointer', textDecoration: 'underline', color: '#1890ff'}}>
                {row.user_name}
              </TableCell>
              </Link>
                <TableCell align="right">{row.user_lastName}</TableCell>
              <TableCell align="right">{row.user_phone}</TableCell>


            </TableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  );
}
