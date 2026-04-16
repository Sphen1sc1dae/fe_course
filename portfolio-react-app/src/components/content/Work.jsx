import {Title, SubTitle} from '../commons/Titles.jsx';
import Categories from './Categories.jsx';
import Projects from './Projects.jsx';

export default function Work() {
    return (
        <section id="work" className="section container">
            <Title title = "My Work"/>
            <SubTitle subTitle= "Projects" />
            <Categories />
            <Projects />
        </section>
    );
}

