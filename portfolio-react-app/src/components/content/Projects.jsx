import React from 'react';
import AvatarImage from '../commons/AvatarImage.jsx';

export default function Projects({projects}) {

    return (
        <ul className="projects">
            { projects?.map((project, idx) => 
                <li className="project" key={idx}>
                    <AvatarImage img={project.img} alt={project.alt} style="project-img"/>
                    <div className="project-meta">
                        <h3 className="project-meta-title">{project.title}</h3>
                        <p>{project.description}</p>
                    </div>
                </li>
            )}
        </ul> 
    );
}

