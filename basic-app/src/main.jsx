import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
// import './index.css'
// import App from './App.jsx'
// import App from './AppAvatar.jsx'
// import App from './AppMenu.jsx'
// import App from './AppButton.jsx'
// import App from './AppCommon.jsx'
// import App from './AppCounter.jsx'
// import App from './AppForm.jsx'
import App from './AppEffect.jsx'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <App />
  </StrictMode>,
  // -> StrictMode 를 사용하게 되면 console 창에서 처음 '테스트' 작업을 거친 결과값을 출력시킨 후, 내부 동작을 수행한다.
)
