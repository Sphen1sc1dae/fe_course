import style from './Avatar.module.css'

export default function AvatarImage({img, style}) {
    return (
        <img src={img} className={style} alt="photo" />
    )
}