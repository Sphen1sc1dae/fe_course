/*
 * 부모 컴퍼넌트 : 최상위 컴퍼넌트 
 */
// import './App.css'
import Header  from './components/Header.jsx';
import Body from './components/Body.jsx';
import Footer from './components/Footer.jsx';

export default function App() {
  return (
    <>
      <Header />
      <Body />
      <Footer />
    </>
  )
}