import {BrowserRouter as Router,Switch,Route} from 'react-router-dom';
import Navbar from './components/Navbar'
import Showcase from './components/Showcase'
import TextField from '@mui/material/TextField';
import Box from '@mui/material/Box';
import Container from '@mui/material/Container';
import CssBaseline from '@mui/material/CssBaseline';
import Typography from '@mui/material/Typography';
import Button from '@mui/material/Button';
import {useState} from 'react'
import Admin from './Admin'
import Cookies from 'js-cookie'
import Alert from '@mui/material/Alert';
import Student from './Student'

function App() {

    const [login, setLogin] = useState(Cookies.get('token') !== undefined ? true : false)
    const [phoneNumber, setPhoneNumber] = useState('')
    const [password, setPassword] = useState('')
    const [response, setResponse] = useState('')
    const loginAdmin = ()=>{
      fetch('https://fulan-back.herokuapp.com/users/login', {
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        method: 'POST',
        body: JSON.stringify(
          {
            'phone': phoneNumber,
            'password': password
          }
        )
      })
      .then(res=>res.json())
      .then(result=>{
         Cookies.set('token', result.token !== undefined ? result.token : null); setLogin(result.ok ? true : false); setResponse(`${result.message}`)
      })
      .catch(err=>console.log(err))
    }
  return (
      <Router>

      <Switch>
      <Route exact path="/">
    {login ? <div className="App">
    <Navbar/>
      <Showcase/>
    </div> : <CssBaseline>
        <Container maxWidth="sm" >
            <Box
      component="form"
      sx={{
        '& > :not(style)': {  textAlign: 'center', display: 'flex', justifyContent: 'center', alignItems: 'center'},
      }}
      noValidate
      autoComplete="off"
    >
    {response !== '' ? <Alert severity={response === "Error: invalid password!" ? 'error' : 'success'} style={{marginTop: '10px'}}>{response}</Alert> : null}
    <Typography variant="h4" component="div" gutterBottom style={{margin: '1rem'}}>
        Login
      </Typography>
        <TextField fullWidth id="outlined-basic fullWidth margin-normal" label="Telefon Raqam" variant="outlined" margin="normal" style={{margin: '3rem 0 2rem 0'}} value={phoneNumber} onChange={e=>setPhoneNumber(e.target.value)} />
        <TextField fullWidth id="outlined-basic fullWidth margin-normal" label="Parol" variant="outlined" margin="normal" style={{margin: '1rem 0'}} type="password" value={password} onChange={e=>setPassword(e.target.value)}/>
        <Button variant="outlined" fullWidth onClick={loginAdmin}>Kirish</Button>
        </Box>
</Container>
</CssBaseline>}
    </Route>
    <Route exact path="/admin">
    <Admin/>
    </Route>
    <Route exact path="/student/:id">
    <Student/>
    </Route>
    </Switch>
    </Router>
  );
}


export default App;
