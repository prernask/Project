import React, {useEffect, useState} from 'react';
export default function App(){
  const [msg, setMsg] = useState('');
  useEffect(()=>{
    fetch('/api/hello').then(r=>r.json()).then(d=>setMsg(d.message)).catch(e=>setMsg('Backend not available'));
  },[]);
  return (
    <div style={{fontFamily:'Arial',padding:20}}>
      <h1>DevOps CI/CD Demo (React + Node)</h1>
      <p>Message from backend: <strong>{msg}</strong></p>
    </div>
  );
}
