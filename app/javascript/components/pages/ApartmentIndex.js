import React from "react";
import { Card, CardBody, CardTitle, CardSubtitle, Button } from "reactstrap";

const ApartmentIndex = ({ apartments }) => {
  return (
    <main className="apartment-index-cards">
      {apartments?.map((apartment, index) => {
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
              <Button>See More Details</Button>
            </CardBody>
          </Card>
        );
      })}
    </main>
  );
};

export default ApartmentIndex;
