import { useState } from 'react';
import BasicCounter from './components/counter/BasicCounter.jsx';

export default function App() {
    // let totalCount = 0; -> 값 변동시 자동 렌더링 X
    const [totalCount, setTotalCount] = useState(0);
    const handleTotalCount = (type) => {
        if(type === '+') setTotalCount(totalCount + 1);
        else setTotalCount(totalCount - 1);
    }

    return (
        <>
            <h1>AppCounter</h1>
            <h1>total Count :: <span><b>{totalCount}</b></span></h1>
            <BasicCounter click={handleTotalCount} total={totalCount}/>
            <BasicCounter click={handleTotalCount} total={totalCount}/>
            <BasicCounter click={handleTotalCount} total={totalCount}/>
        </>
    )
}