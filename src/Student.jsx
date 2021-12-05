import * as React from 'react'
import {useParams} from 'react-router-dom'
import Cookies from 'js-cookie'
import Navbar from './components/Navbar'
import {Button} from '@mui/material'
import AttachmentIcon from '@mui/icons-material/Attachment';
import { Container } from '@mui/material';
import DoneIcon from '@mui/icons-material/Done';
import DoNotDisturbIcon from '@mui/icons-material/DoNotDisturb';

const Student = ()=>{

  const {id} = useParams();
  const [student, setStudent] = React.useState()
  React.useEffect(()=>{
    fetch('https://fulan-back.herokuapp.com/users/get-student', {
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': Cookies.get('token'),
        'user-id': id
      },
      method: 'GET'
    })
    .then(res=>res.json())
    .then(result=>setStudent(result.data))
  },[])

    const activate = ()=>{
      fetch('https://fulan-back.herokuapp.com/users/actiavate', {
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': Cookies.get('token'),
          'user-id': id
        },
        method: 'POST',
        body: JSON.stringify(
          {
            "data": !(student?.isActive)
          }
        )
      })
      .then(res=>res.json())
      .then(result=>{
        console.log(result); window.location.reload()
      })
      .catch(err=>console.log(err))
    }

    return(
      <>
      <Navbar/>
      <Container maxWidth="xl">
      {student?.isActive ? <h1><DoneIcon/> Tekshirilgan</h1>: <h1><DoNotDisturbIcon/> Tekshirilmagan</h1>}
      <h1 style={{margin: '2rem 0'}}>Talaba ismi: {student?.user_name}</h1>
      <h3 style={{margin: '2rem 0'}}>Talaba telefon raqami: {`+${student?.user_phone}`}</h3>
      <h3 style={{display: 'inline', margin: '2rem 0'}}>Yuklangan Talabalik ma'lumotnomasi: </h3><a target="_blank" rel="noreferrer" href={`https://fulan-back.herokuapp.com/files/getFile/${student?.user_files.map(file=>(`${file.photo_id}.${file.type}`))}`} ><Button>Ma'lumotnoma<AttachmentIcon/></Button></a>
        <Button fullWidth variant="outlined" style={{marginTop: '1rem'}} onClick={activate}>{student?.isActive ? 'Tekshirmaslik' : 'Tekshirish' }</Button>
        </Container>
      </>
    )
}

export default Student
