
export default function Image({ img, alt, w, h, className }) {
    return (
        <img src={img} 
            alt={alt}
            style={{
                w: w,
                h: h
            }}
            className = {className}
            />
    )
}