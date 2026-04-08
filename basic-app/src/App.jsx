import Avatar from "./components/avatar/Avatar"
import AvatarImage from "./components/avatar/AvatarImage.jsx"
import AvatarImageList from "./components/avatar/AvatarImageList.jsx"
import AvatarList from "./components/avatar/AvatarList.jsx"
import style from './components/avatar/Avatar.module.css';
import Menu from './components/menu/Menu.jsx';
import mstyle from './components/menu/Menu.module.css';
import people1 from './assets/people1.webp';
import people2 from './assets/people2.webp';
import people3 from './assets/people3.webp';

export default function App() {
  const list = [
    {img: people1, style: style.avatar_img},
    {img: people2, style: style.avatar_img},
    {img: people3, style: style.avatar_img}
  ]
  const alist = [
    {img: people1, name: "Smith"},
    {img: people2, name: "Jamse"},
    {img: people3, name: "Anne"}
  ]
  return (
    <>
      <AvatarImage img={people1} style={style.avatar_img} />
      <Avatar name="Anne" img={people3} />
      <AvatarImageList imgList={list} />
      <AvatarList list={alist} />
    </>
  )
}

// export default App