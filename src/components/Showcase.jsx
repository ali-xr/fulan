import * as React from 'react';
import { styled } from '@mui/material/styles';
import SwipeableViews from 'react-swipeable-views';
import Tabs from '@mui/material/Tabs';
import Tab from '@mui/material/Tab';
import Box from '@mui/material/Box';
import Talabalar from './Talabalar.jsx'
import Homiylar from './Homiylar.jsx'
import Cookies from 'js-cookie'

const AntTabs = styled(Tabs)({
  borderBottom: '1px solid #e8e8e8',
  '& .MuiTabs-indicator': {
    backgroundColor: '#1890ff',
  },
});

const AntTab = styled((props) => <Tab disableRipple {...props} />)(({ theme }) => ({
  textTransform: 'none',
  minWidth: 0,
  [theme.breakpoints.up('sm')]: {
    minWidth: 0,
  },
  fontWeight: theme.typography.fontWeightRegular,
  marginRight: theme.spacing(1),
  color: 'rgba(0, 118, 255, 0.9)',
  fontFamily: [
    '-apple-system',
    'BlinkMacSystemFont',
    '"Segoe UI"',
    'Roboto',
    '"Helvetica Neue"',
    'Arial',
    'sans-serif',
    '"Apple Color Emoji"',
    '"Segoe UI Emoji"',
    '"Segoe UI Symbol"',
  ].join(','),
  '&:hover': {
    color: 'rgba(0, 118, 255, 0.9)',
    opacity: 1,
  },
  '&.Mui-selected': {
    color: '#1890ff',
    fontWeight: theme.typography.fontWeightMedium,
  },
  '&.Mui-focusVisible': {
    backgroundColor: '#d1eaff',
  },
}));


export default function CustomizedTabs() {
  const [students, setStudents] = React.useState()
  const [sponsors, setSponsors] = React.useState()
  React.useEffect(()=>{
    fetch('https://fulan-back.herokuapp.com/users/get/all-students', {
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': Cookies.get('token')
      },
      method: 'GET'
    })
    .then(res=>res.json())
    .then(result=>setStudents(result.data))
  },[])
  React.useEffect(()=>{
    fetch('https://fulan-back.herokuapp.com/users/get/all-sponsor', {
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': Cookies.get('token')
      },
      method: 'GET'
    })
    .then(res=>res.json())
    .then(result=>setSponsors(result.data))
  },[])
  const [value, setValue] = React.useState(0);

  const handleChange = (event, newValue) => {
    setValue(newValue);
  };

  const handleChangeIndex = (index) => {
    setValue(index);
  };
  console.log(students)
  console.log(sponsors)
  return (
    <Box variant="fullWidth">
      <Box sx={{ bgcolor: '#fff' }}>
        <AntTabs value={value} onChange={handleChange} aria-label="ant example" variant="fullWidth">
          <AntTab label="Talabalar" />
          <AntTab label="Homiylar" />
        </AntTabs>
        <Box sx={{ p: 1 }} />
      </Box>
     <SwipeableViews
        index={value}
        onChangeIndex={handleChangeIndex}
      >
        <div value={value} index={0} style={{padding: '0 1.5rem'}}>
        <Talabalar students={students}/>
        </div>
        <div value={value} index={1} style={{padding: '0 1.5rem'}}>
        <Homiylar sponsors={sponsors}/>
        </div>
      </SwipeableViews>
    </Box>
  );
}
