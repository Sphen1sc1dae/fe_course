import AvatarImage from "./components/avatar/AvatarImage.jsx"
import AvatarImageList from "./components/avatar/AvatarImageList.jsx"
import Avatar from "./components/avatar/Avatar.jsx"
import AvatarList from "./components/avatar/AvatarList.jsx"
import style from './components/avatar/Avatar.module.css';
import mstyle from './components/menu/Menu.module.css';
import people1 from './assets/people1.webp';
import people2 from './assets/people2.webp';
import people3 from './assets/people3.webp';

export default function App() {
  const list = [
    {img: people1, style:style.avatar_img},
    {img: people2, style:style.avatar_img},
    {img: people3, style:style.avatar_img_circle},
    {img: people3, style:style.avatar_img}
  ]
  const list2 = [
    { img: "https://cf.lottecinema.co.kr//Media/Event/7cfa9127420c4e47b4d2a56f736561c3.jpg", 
      style:style.avatar_img_circle},
    { img: "https://cf.lottecinema.co.kr//Media/Event/7cfa9127420c4e47b4d2a56f736561c3.jpg", 
      style:style.avatar_img_circle},
    { img: "https://cf.lottecinema.co.kr//Media/Event/7cfa9127420c4e47b4d2a56f736561c3.jpg", 
      style:style.avatar_img_circle}
  ]
  const alist = [
    {img: people1, name: "Smith" },
    {img: people2, name: "James"},
    {img: people3, name: "Anne"},
    {img: people3, name: "Anne"}
  ]
  
  return ( 
    <>
      <AvatarImage img={people1} style={style.avatar_img}/>
      <Avatar name="Anne" img={people3} />
      <AvatarImageList imgList={list} />
      <AvatarImageList imgList={list2} />
      <AvatarList list={alist} />
    </>
  )
}

