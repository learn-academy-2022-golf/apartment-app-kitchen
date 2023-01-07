import React from "react"

const Home = ({logged_in}) => {
  console.log("logged_in:", logged_in)
    if (logged_in === true) {
      return (
        <>
        <h1>Signed in!</h1>
        </>
      )
    } else {
      return (
        <>
        <h1>Signed out  :c</h1>
        </>
      )
    }
  }

export default Home
