import { useOutletContext } from 'react-router-dom';
import { Title, SubTitle } from '../components/commons/Titles.jsx';
import Categories from '../components/content/Categories.jsx';
import Projects from '../components/content/Projects.jsx';

export default function Work() {
    const { data, like, setLike } = useOutletContext();
    return (
        <section id="work" className="section container">
            <Title title = "My Work"/>
            <SubTitle subTitle = "Projects" />
            <Categories categories = {data?.work?.categories}/>
            <Projects projects = {data?.work?.projects} like = {like} setLike = {setLike}/>
        </section>
    );
}

