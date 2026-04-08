import img01 from '../assets/images/img01_seo.png';
import './Header.css';

export default function Header() {
    return (
        <header className='header'>
            <img src={img01} alt="eef" width="150px"/>
            <h1>Header</h1>
        </header>
    )
}