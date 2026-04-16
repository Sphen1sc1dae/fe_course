import './App.css';
import { useState, useEffect } from 'react';
import { fetchData } from './util/fetch.js';
import Header from './components/Header.jsx';
import Content from './components/Content.jsx';
import Footer from './components/Footer.jsx';

export default function App() {
  const [data, setData] = useState({});
  useEffect(()=>{
    const loadData = async() => {
      const jsonData = await fetchData("http://localhost:5173/data/portfolio.json");
      setData(jsonData);
    }
    loadData();
  }, []);

  console.log("data :: ", data);
  

  return (
    <>
      <Header data={data?.header} />
      <Content data={data?.content}/>
      <Footer data={data?.footer}/>
    </>
  )
}


