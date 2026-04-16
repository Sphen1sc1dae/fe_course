import React from 'react';

export default function SkillsCoding({ list }) {
    return (
        <ul>
            {list?.map((skill, idx) => 
                <li className="bar" key={idx}>
                    <div className="bar-title">
                        <span>{skill.title}</span><span>{skill.value}</span>
                    </div>
                    <div className="bar-bg">
                        <div className="bar-value" style={{width:skill.width}}></div>
                    </div>
                </li>            
            )}
        </ul>
    );
}
