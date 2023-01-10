import React from "react";
import { useParams } from "react-router-dom";
import { Card, CardBody, CardTitle, CardSubtitle, Button } from "reactstrap";

const ApartmentShow = ({ apartments }) => {
  const { id } = useParams();
  const currentApartment = apartments?.find(
    (apartment) => apartment.id === +id
  );

  return (
    <>
      <div>
        {currentApartment && (
          <Card
            style={{
              width: "14rem",
            }}
            // key={index}
          >
            <img
              alt={`profile of apartments ${currentApartment.price}`}
              src={currentApartment.image}
            />
            <CardBody>
              <CardTitle tag="h5">{currentApartment.price}</CardTitle>
              <CardSubtitle className="mb-2 text-muted" tag="h6">
                Location: {currentApartment.street}
              </CardSubtitle>
              <CardSubtitle className="mb-2 text-muted" tag="h6">
                Bedrooms: {currentApartment.bedrooms}
              </CardSubtitle>
              <CardSubtitle className="mb-2 text-muted" tag="h6">
                Bathrooms: {currentApartment.bathrooms}
              </CardSubtitle>
              <CardSubtitle className="mb-2 text-muted" tag="h6">
                City: {currentApartment.city}
              </CardSubtitle>
              <CardSubtitle className="mb-2 text-muted" tag="h6">
                State: {currentApartment.state}
              </CardSubtitle>
              <CardSubtitle className="mb-2 text-muted" tag="h6">
                Manager: {currentApartment.manager}
              </CardSubtitle>
              <CardSubtitle className="mb-2 text-muted" tag="h6">
                Email: {currentApartment.email}
              </CardSubtitle>
              <CardSubtitle className="mb-2 text-muted" tag="h6">
                Pets: {currentApartment.pets}
              </CardSubtitle>
            </CardBody>
          </Card>
        )}
      </div>
    </>
  );
};

export default ApartmentShow;
