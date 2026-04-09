
export default function Logo({ img, alt, w, h }) {
    return (
        <img src={img}
            alt={alt}
            style={{
                width: w,
                height: h
            }} />
    )
}