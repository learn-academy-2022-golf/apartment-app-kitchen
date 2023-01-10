import React from "react";
import { render, screen } from "@testing-library/react";
import ApartmentProtectedIndex from "./pages/ApartmentProtectedIndex";

describe("<ApartmentProtectedIndex />", () => {
  it("renders without crashing", () => {
    const div = document.createElement("div");
    render(<ApartmentProtectedIndex />, div);
    expect(screen.getByText("CurrentApartmentIndex")).toBeInTheDocument();
  });
});
