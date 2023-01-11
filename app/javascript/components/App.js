import React, { useState, useEffect } from "react";
import { BrowserRouter, Routes, Route } from "react-router-dom";

import Footer from "./components/Footer";
import Header from "./components/Header";

import ApartmentEdit from "./pages/ApartmentEdit";
import ApartmentIndex from "./pages/ApartmentIndex";
import ApartmentProtectedIndex from "./pages/ApartmentProtectedIndex";
import ApartmentNew from "./pages/ApartmentNew";
import ApartmentShow from "./pages/ApartmentShow";
import Home from "./pages/Home";
import NotFound from "./pages/NotFound";

const App = (props) => {
  const [apartments, setApartments] = useState([]);

  useEffect(() => {
    readApartments()
  }, [])

  const readApartments = () => {
    fetch("/apartments")
      .then((response) => response.json())
      .then((payload) => {
        setApartments(payload)
      })
      .catch((error) => console.log(error))
  }

  const createApartment = (apartment) => {
    console.log(apartment)
  }

  const updateApartment = (apartment) => {
    console.log(apartment)
  }

  const deleteApartment = (id) => {
    console.log(id)
  }

  return (
    <BrowserRouter>
      <Header {...props} />
      <Routes>
        <Route exact path="/" element={<Home {...props} />} />
        <Route
          path="/apartmentindex"
          element={<ApartmentIndex apartments={apartments} />}
        />
        <Route
          path="/myapartments"
          element={
            <ApartmentProtectedIndex apartments={apartments} {...props} deleteApartment={deleteApartment} />
          }
        />
        <Route
          path="/apartmentshow/:id"
          element={<ApartmentShow {...props} apartments={apartments} />}
        />
        <Route path="/apartmentnew" element={<ApartmentNew {...props} createApartment={createApartment}/>} />
        <Route path="/apartmentedit/:id" element={<ApartmentEdit {...props} updateApartment={updateApartment} apartments={apartments}/>} />
        <Route element={<NotFound />} />
      </Routes>
      <Footer />
    </BrowserRouter>
  );
};

export default App;
