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
    readApartments();
  }, []);

  const readApartments = () => {
    fetch("/apartments")
      .then((response) => response.json())
      .then((payload) => {
        setApartments(payload);
      })
      .catch((error) => console.log(error));
  };

  const createApartment = (apartment) => {
    fetch("http://localhost:3000/apartments", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ apartment }),
    })
      .then((response) => response.json())
      .then(() => readApartments())
      .catch((error) => console.error(error));
  };

  const updateApartment = (apartment, id) => {
    console.log(apartment, id)
    fetch(`http://localhost:3000/apartments/${id}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ apartment }),
    })
      .then((response) => response.json())
      .then(() => readApartments())
      .catch((error) => console.error(error));
  };

  const deleteApartment = (id) => {
    fetch(`http://localhost:3000/apartments/${id}`, {
      headers: {
        "Content-Type": "application/json"
      },
      method: "DELETE"
    })
      .then((response) => response.json())
      .then(() => readApartments())
      .catch((errors) => console.log("delete errors:", errors))
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
            <ApartmentProtectedIndex
              apartments={apartments}
              {...props}
              deleteApartment={deleteApartment}
            />
          }
        />
        <Route
          path="/apartmentshow/:id"
          element={<ApartmentShow {...props} apartments={apartments} />}
        />
        <Route
          path="/apartmentnew"
          element={
            <ApartmentNew
              {...props}
              createApartment={createApartment}
              readApartments={readApartments}
            />
          }
        />
        <Route
          path="/apartmentedit/:id"
          element={
            <ApartmentEdit
              {...props}
              updateApartment={updateApartment}
              apartments={apartments}
            />
          }
        />
        <Route element={<NotFound />} />
      </Routes>
      <Footer />
    </BrowserRouter>
  );
};

export default App;
