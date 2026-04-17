import AvatarImage from "../commons/AvatarImage.jsx"

export default function Logo({img, alt, style, title, like}) {
    return(
        <div className="header-logo">
            <AvatarImage 
                    img={img}
                    alt={alt}
                    style={style} />
            <h1 className="header-logo-title">{title}::SPA::♥️({like})</h1>
        </div>
    )
}