import style from './Menu.module.css'

export default function Menu({title, href, style}) {
    return (
        <a href={href} className={style} >{title}</a>
    )
}