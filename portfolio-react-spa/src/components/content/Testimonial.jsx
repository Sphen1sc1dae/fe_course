import React from 'react';
import AvatarImage from '../commons/AvatarImage.jsx';

export default function Testmonial({item}) {
    return (
        <>
            <AvatarImage img = {item.img} alt = {item.alt} style = "testimonial-img" />
            <div className="testimonial-text">
                <p>{item.description}</p>
                <p><a href="#" className="testimonial-text-name">{item.name}<span className="testimonial-text-cmp">{item.company}</span></a></p>
            </div>
        </>
    );
}

