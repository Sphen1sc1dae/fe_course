import EffectCounter from './components/effects/EffectCounter.jsx'
import { useState } from 'react'

export default function App() {
    const [show, setShow] = useState(true);

    return (
        <>
            { show && <EffectCounter /> }
            <button onClick={() => setShow(!show)}>
                {show? '숨기기' : '보이기'}
            </button>
        </>
    )
}