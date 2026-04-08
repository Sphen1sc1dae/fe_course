import AvatarImage from './AvatarImage.jsx'
import style from './Avatar.module.css'

export default function Avatar({name, img}) {
    return (
        <div className={style.avatar}>
            <AvatarImage img={img} style={style.avatar_img_circle} />
            <p>{name}</p>
        </div>
    )
}