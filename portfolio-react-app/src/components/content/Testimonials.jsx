import React from 'react';
import { SubTitle, Title } from '../commons/Titles';
import Testimonial from './Testimonial';

export default function Testimonials({data}) {

    return (
        <section id="testimonial" className="section container">
            <Title title= "Testimonials" />
            <SubTitle subTitle= "See What they say about me" />
            <ul className="testimonials">
                {data?.map((item, idx) => 
                    <li className="testimonial" key={idx}>
                        <Testimonial item={item}/>
                    </li>
                )}
            </ul>
        </section>
    );
}

