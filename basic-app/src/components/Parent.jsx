import Child from "./Child.jsx"

function PropsComp() {
    return (
        <h1>PropsComp!!</h1>
    )
}

export default function Parent(props) {
    return (
        <>
            <h1>Parent:: {props.name}</h1>
            {/* <Child name = "Hong" age = "20" info = {info}/> */}
            <Child>
                <PropsComp/>
            </Child>
        </>
    )
}