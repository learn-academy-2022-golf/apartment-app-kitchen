import React from "react"
import { NavLink } from 'reactstrap'

const Home = (props) => {
  const logged_in = props.logged_in
  const in_route = props.sign_in_route
  const up_route = props.new_user_route
  console.log(logged_in)
    if (logged_in === true) {
      return (
        <>
        <h1>WELCOME!</h1>
        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Temporibus enim harum quidem quia facilis, repellendus suscipit ducimus eveniet assumenda, blanditiis libero itaque delectus rerum culpa modi! Maiores distinctio veniam magni.</p>
        <NavLink href='/apartmentindex'>
          <button>My Listings</button>
        </NavLink>
        <NavLink href='/apartmentindex'>
          <button>View all listings</button>
        </NavLink>
        </>
      )
    } else {
      return (
        <>
        <h1>WELCOME! Please sign in</h1>
        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Temporibus enim harum quidem quia facilis, repellendus suscipit ducimus eveniet assumenda, blanditiis libero itaque delectus rerum culpa modi! Maiores distinctio veniam magni.</p>
        <NavLink href= {in_route}>
          <button>Sign in</button>
        </NavLink>
        <NavLink href={up_route}>
          <button>Sign up</button>
        </NavLink>
        </>
      )
    }
  }

export default Home
