import Avatar from './Avatar.jsx'
import style from './Avatar.module.css'

export default function AvatarList({ list }) {
    return (
        <div className={style.avatar_list}>
            {
                list.map(item => 
                    <Avatar img={item.img} name={item.name}/>)
            }
        </div>
    )
}