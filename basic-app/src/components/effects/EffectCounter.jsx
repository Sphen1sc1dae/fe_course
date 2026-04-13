import { useEffect, useState } from 'react';

export default function EffectCounter() {
    const [count, setCount] = useState(0);
    useEffect(() => {
        console.log('🟢mount & update !!');
        return() => {
            console.log('🔴컴포넌트 마운트시 작업할 내용 호출 !!');
            console.log('🔴mount & update !!');
        }
    }, [count]);
    
    return (
        <div style={ {width:'400px', textAlign: 'center', border: '1px solid gray'} }>
            <h1>{count}</h1>
            <button type="button" onClick={() => setCount(count+1)}>Increase</button>
            <button type="button" onClick={() => setCount(count-1)}>Decrease</button>
        </div>
    )
}