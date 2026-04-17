import React from 'react';
import { SubTitle, Title } from '../components/commons/Titles';
import { useOutletContext } from 'react-router-dom';
import Testimonial from '../components/content/Testimonial';

export default function Testimonials() {
    const { data } = useOutletContext();
    return (
        <section id="testimonial" className="section container">
            <Title title= "Testimonial" />
            <SubTitle subTitle= "See What they say about me" />
            <ul className="testimonials">
                {data?.testimonials?.map((item, idx) => 
                    <li className="testimonial" key={idx}>
                        <Testimonial item={item}/>
                    </li>
                )}
            </ul>
        </section>
    );
}

