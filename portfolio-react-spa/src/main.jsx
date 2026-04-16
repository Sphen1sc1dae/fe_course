import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import App from './App.jsx'
import { createBrowserRouter, RouterProvider } from 'react-router-dom'
import Home from './components/content/Home.jsx'
import About from './components/content/About.jsx'
import Skills from './components/content/Skills.jsx'
import Work from './components/content/Work.jsx'
import Testimonials from './components/content/Testimonials.jsx'

// router 객체 생성
const router = createBrowserRouter(
  [
    {
      path: "/",
      element: <App/>, // Layout 구성 컴포넌트 정의 : App.jsx 미리 생성됨
      children: [
        {index: true, element: <Home />},
        {path: "/about", element: <About />},
        {path: "/skills", element: <Skills />},
        {path: "/work", element: <Work />},
        {path: "/testimonials", element: <Testimonials />}
      ]
    }
  ]
);

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <RouterProvider router = {router}/>
    {/* <App /> */}
  </StrictMode>,
)
