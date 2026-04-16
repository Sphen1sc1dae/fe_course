import React from 'react';
import AvatarImage from '../commons/AvatarImage.jsx';

export default function Projects() {
    const projects = [
        {
            "img" : "images/projects/project1.webp",
            "alt" : "project_img",
            "title" : "Project#1",
            "description" : "Clone Coding with HTML, CSS"
        },
        {
            "img" : "images/projects/project2.webp",
            "alt" : "project_img",
            "title" : "Project#2",
            "description" : "Clone Coding with HTML, CSS"
        },
        {
            "img" : "images/projects/project3.webp",
            "alt" : "project_img",
            "title" : "Project#3",
            "description" : "Clone Coding with HTML, CSS"
        },
        {
            "img" : "images/projects/project4.webp",
            "alt" : "project_img",
            "title" : "Project#4",
            "description" : "Clone Coding with HTML, CSS"
        },
        {
            "img" : "images/projects/project5.webp",
            "alt" : "project_img",
            "title" : "Project#5",
            "description" : "Clone Coding with HTML, CSS"
        },
        {
            "img" : "images/projects/project6.webp",
            "alt" : "project_img",
            "title" : "Project#6",
            "description" : "Clone Coding with HTML, CSS"
        },
        {
            "img" : "images/projects/project7.webp",
            "alt" : "project_img",
            "title" : "Project#7",
            "description" : "Clone Coding with HTML, CSS"
        },
        {
            "img" : "images/projects/project8.webp",
            "alt" : "project_img",
            "title" : "Project#8",
            "description" : "Clone Coding with HTML, CSS"
        },
    ]

    return (
        <ul className="projects">
            { projects.map((project, idx) => {
                <li className="project">
                    <AvatarImage img={project.img} alt={project.alt} style="project-img"/>
                    <div className="project-meta">
                        <h3 className="project-meta-title">{project.title}</h3>
                        <p>{project.description}</p>
                    </div>
                </li>
            })}
        </ul> 
    );
}

