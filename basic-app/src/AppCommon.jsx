import Logo from "./common/Logo.jsx";
import Image from "./common/Image.jsx";
import people1 from './assets/people1.webp';

export default function App() {
    return (
        <>
            <Logo img="https://cdn.cgv.co.kr/cgvpomscontent/ips/unitCnts/2025/1114/4c8da3708290405bb6400a6a553cade2.svg"
                  alt="CGV Logo"
                  w="200px"
                  h="50px"/>
            <Logo img="https://www.lottecinema.co.kr/NLCHS/Content/images/common/logo_footer.gif"
                  alt="Lotte Cinema Logo"
                  w="300px"
                  h="50px"/>
            
            <Image img={people1}
                    alt="프로필 사진"
                    w="180px"
                    h="200px"  />
            <Image img="https://cf2.lottecinema.co.kr/lotte_image/2026/Farewell/Farewell_980180_33.jpg"
                    alt="패왕별희"
                    w="100%"
                    h=""  />
        </>
    )
}