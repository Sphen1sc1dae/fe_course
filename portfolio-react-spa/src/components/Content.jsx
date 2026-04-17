import Home from "../pages/Home.jsx"
import About from "../pages/About.jsx"
import Skills from "../pages/Skills.jsx"
import Work from "../pages/Work.jsx"
import Testimonials from "../pages/Testimonials.jsx"
import ArrowTop from "./content/ArrowTop.jsx"

export default function Content({ data }) {
    // console.log('Content :: data :: ', data?.home);    
    return(
        <>
            <Home data={data?.home}/>
            <About data={data?.about}/> 
            <Skills data={data?.skills}/>
            <Work data={data?.work}/>
            <Testimonials data={data?.testimonials}/>
            <ArrowTop />
        </>
    )
}