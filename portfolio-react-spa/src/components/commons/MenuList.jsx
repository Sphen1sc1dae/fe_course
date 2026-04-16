import { useState } from 'react';
import Menu from "./Menu.jsx";

export default function MenuList({ menus, style }) {
    // const [name, setName] = useState('Home');
    // const handleClick = (name) => {
    //     setName(name);       
    // } -> Menu.jsx 에서 NavLink 사용하기 때문에 useState 필요 X
    return(
        <nav>
            <ul className={style}>
                { menus.map((menu, idx)=>
                    <li key={idx}>
                        <Menu  href={menu.href} 
                                style={ menu.style }
                                name={menu.name}
                                />
                    </li>
                ) }
            </ul>
        </nav>
    )
}