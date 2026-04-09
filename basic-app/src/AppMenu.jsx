import Menu from "./components/menu/Menu.jsx"
import MenuList from "./components/menu/MenuList.jsx"
import style from "./components/menu/Menu.module.css"

export default function App() {
    const list = [
        { title:"로그인", href:"#", style:style.menu1 },
        { title:"회원가입", href:"#", style:style.menu1 },
        { title:"고객센터", href:"#", style:style.menu1 },
        { title:"게시판", href:"#", style:style.menu1 },
        { title:"My CGV", href:"#", style:style.menu1 },
    ]
    const list2 = [
        { title:"예매", href:"#", style:style.menu2 },
        { title:"영화", href:"#", style:style.menu2 },
        { title:"영화관", href:"#", style:style.menu2 },
        { title:"이벤트", href:"#", style:style.menu2 },
        { title:"스토어", href:"#", style:style.menu2 },
    ]

    return (
        <>
            <div>
                <Menu   title="Naver" 
                        href="http://www.naver.com"
                        style={style.menu1}
                        />
                <Menu   title="Google" 
                        href="http://www.google.com"
                        style={style.menu2}
                        />
            </div>
            <MenuList list={list} />
            <MenuList list={list2} />
        </>
    )
}