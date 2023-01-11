import React from "react";
import { Card, CardBody, CardTitle, CardSubtitle, Button } from "reactstrap";
import { NavLink } from "react-router-dom";

const ApartmentProtectedIndex = ({ apartments, logged_in, current_user, deleteApartment }) => {
  const current_user_apartments = apartments?.filter((apartment) => {
    return apartment.user_id === current_user.id;
  });
  return (
    <>
      <h3>CurrentApartmentIndex</h3>
      {current_user_apartments?.map((apartment, index) => {
        return (
          <Card
            style={{
              width: "14rem",
            }}
            key={index}
          >
            <img
              alt={`profile of apartments ${apartment.price}`}
              src={apartment.image}
            />
            <CardBody>
              <CardTitle tag="h5">{apartment.price}</CardTitle>
              <CardSubtitle className="mb-2 text-muted" tag="h6">
                Location: {apartment.street}
              </CardSubtitle>
              <CardSubtitle className="mb-2 text-muted" tag="h6">
                Bedrooms: {apartment.bedrooms}
              </CardSubtitle>
              <CardSubtitle className="mb-2 text-muted" tag="h6">
                Bathrooms: {apartment.bathrooms}
              </CardSubtitle>
              <NavLink to={`/apartmentshow/${apartment.id}`}>
                <Button>See More Details</Button>
              </NavLink>
              <NavLink to={`/apartmentedit/${apartment.id}`}>
                <Button>Edit this listing</Button>
              </NavLink>
              <NavLink to="/">
                <Button onClick={() => deleteApartment(`${apartment.id}`)}>Delete this listing</Button>
              </NavLink>
            </CardBody>
          </Card>
        );
      })}
    </>
  );
};

export default ApartmentProtectedIndex;
