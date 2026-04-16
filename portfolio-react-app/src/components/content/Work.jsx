import {Title, SubTitle} from '../commons/Titles.jsx';
import Categories from './Categories.jsx';
import Projects from './Projects.jsx';

export default function Work({data}) {
    return (
        <section id="work" className="section container">
            <Title title = "My Work"/>
            <SubTitle subTitle = "Projects" />
            <Categories categories = {data?.categories}/>
            <Projects projects = {data?.projects}/>
        </section>
    );
}

