import React from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import {faArrowCircleUp} from '@fortawesome/free-solid-svg-icons';

export default function ArrowTop() {
    return (
        <aside>
            <a href="#" className="arrow-up"><FontAwesomeIcon icon={faArrowCircleUp}/></a>
        </aside>
    );
}