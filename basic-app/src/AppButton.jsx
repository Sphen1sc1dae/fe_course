import Button from './components/button/Button.jsx';

export default function App() {
    const stylesObj = {
        w: "100px",
        h: "50px",
        bg: "blue",
        color:"white"
    }
    const stylesObj2 = {
        w: "200px",
        h: "30px",
        bg: "gray",
        color:"white"
    }

    return (
        <>
            <Button type="button"
                    name="버튼1"
                    styles={stylesObj} 
                    />
            <Button type="submit"
                    name="회원가입"
                    styles={stylesObj2}
                    />
        </>
    )
}