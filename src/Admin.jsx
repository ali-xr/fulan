import * as React from 'react'
import Navbar from './components/Navbar'
import TextField from '@mui/material/TextField';
import Box from '@mui/material/Box';
import Container from '@mui/material/Container';
import CssBaseline from '@mui/material/CssBaseline';
import Typography from '@mui/material/Typography';
import Button from '@mui/material/Button';
import Cookies from 'js-cookie'
import {Alert} from '@mui/material'

const Admin = ()=>{
  const [phoneNumber, setPhoneNumber] = React.useState()
  const [response, setResponse] = React.useState('')
  const addAdmin = ()=>{
    fetch('https://fulan-back.herokuapp.com/users/set-admin', {
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': Cookies.get('token'),
      },
      method: 'POST',
      body: JSON.stringify(
        {
          "phone": phoneNumber
        }
      )
    })
    .then(res=>res.json())
    .then(result=>{
      setResponse(result.message);  setTimeout(()=>{window.location="/"}, 3000 )
    })
    .catch(err=>console.log(err))
  }
    return(
        <>
        <Navbar/>
        <CssBaseline>
            <Container maxWidth="sm" >
                <Box
          component="form"
          sx={{
            '& > :not(style)': {  textAlign: 'center', display: 'flex', justifyContent: 'center', alignItems: 'center'},
          }}
          noValidate
          autoComplete="off"
        >
        {response !== '' ? <Alert severity={response === 'Error: Phone number is invalid' ? 'error': 'success'} style={{marginTop: '1rem'}}>{response}</Alert> : null}
        <Typography variant="h4" component="div" gutterBottom style={{margin: '1rem'}}>
            Yangi Admin qo'shish
          </Typography>
            <TextField fullWidth id="outlined-basic fullWidth margin-normal" label="Telefon Raqam" variant="outlined" margin="normal" style={{margin: '3rem 0 2rem 0'}} value={phoneNumber} onChange={e=>setPhoneNumber(e.target.value)}/>
            <Button variant="outlined" fullWidth onClick={addAdmin}>Qo'shish</Button>
            </Box>
    </Container>
    </CssBaseline>
        </>
    )
}

export default Admin
