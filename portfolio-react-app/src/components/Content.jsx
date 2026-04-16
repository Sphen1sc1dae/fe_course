import Home from "./content/Home.jsx"
import About from "./content/About.jsx"
import Skills from "./content/Skills.jsx"
import Work from "./content/Work.jsx"

export default function Content({ data }) {
    // console.log('Content :: data :: ', data?.home);    
    return(
        <>
            <Home data={data?.home}/>
            <About data={data?.about}/> 
            <Skills data={data?.skills}/>
            <Work />
        </>
    )
}