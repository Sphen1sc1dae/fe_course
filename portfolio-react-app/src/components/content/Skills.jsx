import { Title, SubTitle, TitleDescription } from "../commons/Titles.jsx"
import SkillsContent from "./SkillsContent.jsx";

export default function Skills({ data }) {
    return (
        <section id="skills" className="section container">
            <Title title="My Skills" />
            <SubTitle subTitle="Skills & Attributes" />
            <TitleDescription titleDescription={data?.description} />
            <SkillsContent skills={data}/>
        </section>
    )
}