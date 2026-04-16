import React from 'react';

export default function Categories() {
    const categories = [
        {"category" : "ALL", "count" : "8"},
        {"category" : "Front-end", "count" : "4"},
        {"category" : "Back-end", "count" : "2"},
        {"category" : "Mobile", "count" : "2"}
    ]
    return (
        <ul className="categories">
            { categories?.map((item, idx) => {
                <li key={idx}><button className="category">{item.category}<span className="category-count">{item.count}</span></button></li>
            }) }
        </ul>
    );
}

