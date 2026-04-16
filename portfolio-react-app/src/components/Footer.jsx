import { Description, Title } from "./commons/Titles";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {faGithub, faLinkedin} from "@fortawesome/free-brands-svg-icons"

export default function Footer({data}) {

    return (
        <footer id="contact" className="footer">
            <Title title = "Let's Talk"/>
            <Description description="com.developer.judy@gmail.com"/>
            <ul className="contact-links">
                {data?.list?.map((item, idx) => 
                    <li key={idx}>
                        <a href={item.href} className="contact-link">
                            {item.icon === "github" && <FontAwesomeIcon icon = {faGithub}/>}
                            {item.icon === "linkedin" && <FontAwesomeIcon icon = {faLinkedin}/>}
                        </a>
                    </li>
                )}
            </ul>
            <p>{data?.description}</p>
        </footer>
    )
}